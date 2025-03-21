import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_things/material_things.dart';
import 'package:material_things/src/_bindings.dart';

typedef CountryFinderWithinUserInput = Country? Function(String, List<Country>);

final twoLetterCodeRegExp = RegExp(r'\b\p{L}{2}\b', unicode: true);
final phoneCountryCodeRegExp = RegExp(r'\b\d{1,3}\b', unicode: true);

/// Chad is the shortest, maybe.
final fullNameRegExp = RegExp(
  r'(\b[\p{L}\s]{3,}\b)',
  unicode: true,
  caseSensitive: false,
);

bool _zeroGroupEqualsToContent(RegExp regExp, String input, String content) {
  return regExp.firstMatch(input)?.group(0)?.toLowerCase() ==
      content.toLowerCase();
}

Country? defaultUserInputFindCountry(String input, List<Country> countries) {
  return _defaultUserInputFindCountry(input, countries);
}

Country? _defaultUserInputFindCountry(
  String input,
  List<Country> countries, [
  bool phoneCodeOnly = false,
]) {
  final matches = <Country>[];

  for (final country in countries) {
    var hasMatch = false;

    hasMatch |=
        !phoneCodeOnly &&
        _zeroGroupEqualsToContent(fullNameRegExp, input, country.fullName);
    hasMatch |=
        !phoneCodeOnly &&
        _zeroGroupEqualsToContent(
          twoLetterCodeRegExp,
          input,
          country.twoLetterCode,
        );
    hasMatch |= _zeroGroupEqualsToContent(
      phoneCountryCodeRegExp,
      input,
      country.phoneCountryCode.toString(),
    );

    if (hasMatch) {
      matches.add(country);
    }
  }

  /// In case of [phoneCodeOnly] or when user inputs phone code with custom type field.
  if (MaterialThingsBindings.instance.isInitialized) {
    final countryIso =
        MaterialThingsBindings.instance.telephonyData.countryIso.toLowerCase();
    final countryMatchedUserCountry = matches.firstWhereOrNull((c) {
      final cLower = c.twoLetterCode.toLowerCase();
      return cLower == countryIso;
    });
    if (countryMatchedUserCountry != null) {
      return countryMatchedUserCountry;
    }
  } else {
    /// Initialize for the future.
    MaterialThingsBindings.instance.ensureInitialized().onError((
      error,
      stacktrace,
    ) {
      if (kDebugMode) {
        debugPrintStack(
          label:
              'Error happens while initializing MaterialThingsBindings.'
              'This error is safe, but it needed to be debugged.\n'
              'Without MaterialThingsBindings there is no user country detection'
              'country CountryField.',
          stackTrace: stacktrace,
        );
      }
    });
  }

  return matches.firstOrNull;
}

String defaultDisplayCountry(CountryFieldType type, Country? country) {
  if (country == null) {
    return '';
  }
  return switch (type) {
    CountryFieldType.plusSignPrefixedPhoneCode => '${country.phoneCountryCode}',
    CountryFieldType.custom => country.fullName,
  };
}

enum CountryFieldType {
  /// Adds '+' prefixText to underlying [TextField] and restricts field length,
  /// content and uses different matcher than [CountryField.findCountryByUserInput].
  ///
  /// [CountryField.onChanged] and [CountryEditingController] will be notified
  /// when user input exists in [CountryField.countries] as a
  /// [Country.phoneCountryCode].
  plusSignPrefixedPhoneCode,

  /// Matching a country is controlled by [CountryField.findCountryByUserInput]
  /// and [defaultUserInputFindCountry].
  custom,
}

class CountryField extends StatefulWidget {
  const CountryField({
    required this.countries,
    super.key,
    this.groupId = EditableText,
    this.displayCountry = defaultDisplayCountry,
    this.controller,
    this.restorationId,
    this.onTapOutside,
    this.focusNode,
    this.type = CountryFieldType.plusSignPrefixedPhoneCode,
    this.onChanged,
    this.decoration = const InputDecoration(),
    this.enabled = true,
    this.inputFormatters = const [],
    this.keyboardType = TextInputType.text,
    this.findCountryByUserInput = defaultUserInputFindCountry,
    this.onEditingComplete,
    this.onTap,
    this.onSubmitted,
    this.spellCheckConfiguration,
    this.expands = false,
    this.maxLines = 1,
    this.maxLength,
    this.minLength,
    this.style,
    this.autofocus = false,
    this.autofillHints,
  }) : assert(
         type == CountryFieldType.plusSignPrefixedPhoneCode
             ? keyboardType == TextInputType.number
             : true,
       );

  /// Will be called on [controller] notify to create a text for underlying
  /// [TextField].
  final String Function(CountryFieldType, Country?) displayCountry;

  /// What's to show and how to match user-input with [countries].
  final CountryFieldType type;

  /// Country finder for user-input.
  final CountryFinderWithinUserInput findCountryByUserInput;

  /// Countries to use by underlying input when searching
  /// country codes.
  final List<Country> countries;

  /// Controller.
  final CountryEditingController? controller;

  /// Will be concatenated with [FilteringTextInputFormatter] when type is
  /// [CountryFieldType.plusSignPrefixedPhoneCode] to restrict non-digits.
  final List<TextInputFormatter> inputFormatters;
  final FocusNode? focusNode;
  final String? restorationId;
  final TapRegionCallback? onTapOutside;
  final TextInputType keyboardType;
  final bool enabled;
  final InputDecoration decoration;
  final void Function(Country?)? onChanged;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final void Function(Country? country)? onSubmitted;
  final SpellCheckConfiguration? spellCheckConfiguration;
  final bool expands;
  final int? minLength;
  final int? maxLength;
  final int? maxLines;
  final TextStyle? style;
  final bool autofocus;
  final Iterable<String>? autofillHints;
  final Object groupId;

  @override
  State<CountryField> createState() => _CountryFieldState();
}

class _CountryFieldState extends State<CountryField> with RestorationMixin {
  final TextEditingController _textFieldController = TextEditingController();

  RestorableCountryEditingController? _controller;
  CountryEditingController get _effectiveController =>
      widget.controller ?? _controller!.value;

  void _textFieldOnChangeProxy(String text) {
    widget.onChanged?.call(_findCountryInTextFieldControllerText());
  }

  void _onTextFieldControllerNotify() {
    _onInternallyCountryChange(_findCountryInTextFieldControllerText());
  }

  void _textFieldOnSubmittedProxy(String text) {
    if (widget.onSubmitted == null) {
      return;
    }
    widget.onSubmitted!(_findCountryInTextFieldControllerText());
  }

  Country? _findCountryInTextFieldControllerText() {
    final userInput = _textFieldController.text;
    if (widget.type == CountryFieldType.plusSignPrefixedPhoneCode) {
      return _defaultUserInputFindCountry(userInput, widget.countries, true);
    }
    return widget.findCountryByUserInput(userInput, widget.countries);
  }

  void _onInternallyCountryChange(Country? country) {
    _unregisterCountryEditingControllerListeners();
    _effectiveController.country = country;
    _registerCountryEditingControllerListeners();
  }

  void _onExternallyCountryChange() {
    _unregisterTextFieldControllerListeners();
    _textFieldController.text = widget.displayCountry(
      widget.type,
      _effectiveController.country,
    );
    _registerTextFieldControllerListeners();
  }

  void _unregisterTextFieldControllerListeners() {
    _textFieldController.removeListener(_onTextFieldControllerNotify);
  }

  void _registerTextFieldControllerListeners() {
    _textFieldController.addListener(_onTextFieldControllerNotify);
  }

  void _unregisterCountryEditingControllerListeners() {
    _effectiveController.removeListener(_onExternallyCountryChange);
  }

  void _registerCountryEditingControllerListeners() {
    _effectiveController.addListener(_onExternallyCountryChange);
  }

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _createLocalController();
      _registerController();
    }
    _registerCountryEditingControllerListeners();
    _registerTextFieldControllerListeners();
  }

  @override
  void didUpdateWidget(CountryField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller == null && oldWidget.controller != null) {
      _createLocalController(oldWidget.controller!.value);
    } else if (widget.controller != null && oldWidget.controller == null) {
      unregisterFromRestoration(_controller!);
      _controller!.dispose();
      _controller = null;
    }
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    if (_controller != null) {
      _registerController();
    }
  }

  void _registerController() {
    assert(_controller != null);
    registerForRestoration(_controller!, 'controller');
  }

  void _createLocalController([CountryEditingValue? value]) {
    assert(_controller == null);
    _controller =
        value == null
            ? RestorableCountryEditingController()
            : RestorableCountryEditingController.fromValue(value);

    if (!restorePending) {
      _registerController();
    }
  }

  @override
  String? get restorationId => widget.restorationId;

  @override
  void dispose() {
    _textFieldController.dispose();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var decoration = widget.decoration;
    var maxLength = widget.maxLength;

    if (widget.type == CountryFieldType.plusSignPrefixedPhoneCode) {
      maxLength = 3;
      decoration = decoration.copyWith(
        prefixText: '+',
        counter: SizedBox.shrink(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      );
    }

    final inputFormatters = [
      ...widget.inputFormatters,
      if (widget.type == CountryFieldType.plusSignPrefixedPhoneCode)
        FilteringTextInputFormatter(notADigitRE, allow: false),
    ];

    return TextField(
      groupId: widget.groupId,
      decoration: decoration,
      restorationId: 'country',
      autocorrect: false,
      maxLines: widget.maxLines,
      maxLength: maxLength,
      onSubmitted: _textFieldOnSubmittedProxy,
      onChanged: _textFieldOnChangeProxy,
      spellCheckConfiguration: widget.spellCheckConfiguration,
      controller: _textFieldController,
      minLines: widget.minLength,
      expands: widget.expands,
      focusNode: widget.focusNode,
      enabled: widget.enabled,
      keyboardType:
          widget.keyboardType == TextInputType.none &&
                  widget.type == CountryFieldType.plusSignPrefixedPhoneCode
              ? TextInputType.number
              : widget.keyboardType,
      onTapOutside: widget.onTapOutside,
      onEditingComplete: widget.onEditingComplete,
      onTap: widget.onTap,
      style: widget.style,
      autofocus: widget.autofocus,
      inputFormatters: inputFormatters,
      autofillHints: widget.autofillHints,
    );
  }
}
