import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:material_things/material_things.dart';

part 'phone_field.freezed.dart';

final _oneAndMoreSpaces = RegExp(r'\s+', unicode: true);
final _oneAndMoreNonDigit = RegExp(r'\D+', unicode: true);

class PhoneField extends StatefulWidget {
  const PhoneField({
    required this.countries,
    super.key,
    this.groupId = EditableText,
    this.controller,
    this.restorationId,
    this.onTapOutside,
    this.focusNode,
    this.onChanged,
    this.decoration = const InputDecoration(),
    this.enabled = true,
    this.inputFormatters = const [],
    this.keyboardType = TextInputType.number,
    this.onEditingComplete,
    this.onTap,
    this.onSubmitted,
    this.spellCheckConfiguration,
    this.expands = false,
    this.maxNsnLength,
    this.minNsnLength,
    this.style,
    this.autofocus = false,
    this.autoFormat = false,
  });

  /// Whether to provide [DefaultPhoneFieldNsnInputFormatter].
  final bool autoFormat;

  /// Countries to use by underlying [CountryField].
  final List<Country> countries;

  /// Controller.
  final PhoneEditingController? controller;

  /// Used for nsn [TextField]. It [autoFormat] is true we insert our built-in
  /// formatter based on [Country.format] which is XXX XXX, where we just
  /// insert spaces at different locations, with restricting non-digits.
  final List<TextInputFormatter> inputFormatters;
  final FocusNode? focusNode;
  final String? restorationId;
  final TapRegionCallback? onTapOutside;
  final TextInputType keyboardType;
  final bool enabled;
  final InputDecoration decoration;
  final void Function(Country?, String nsn)? onChanged;
  final void Function(Country?, String nsn)? onSubmitted;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final SpellCheckConfiguration? spellCheckConfiguration;
  final bool expands;
  final int? minNsnLength;
  final int? maxNsnLength;
  final TextStyle? style;
  final bool autofocus;
  final Object groupId;

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> with RestorationMixin {
  final _nsnProxyController = TextEditingController();
  final _countryProxyController = CountryEditingController();

  RestorablePhoneEditingController? _controller;
  PhoneEditingController get _effectiveController =>
      widget.controller ?? _controller!.value;

  void _mayAutoFormat() {
    if (widget.autoFormat) {
      final formatter = _DefaultPhoneFieldNsnInputFormatter(
        _effectiveController,
      );
      _nsnProxyController.value = formatter._format(_nsnProxyController.value);
    }
  }

  void _nsnFieldChange(String nsn) {
    widget.onChanged?.call(_effectiveController.country, nsn);
  }

  void _countryFieldChange(Country? country) {
    widget.onChanged?.call(country, _effectiveController.nsn);
  }

  void _nsnFieldSubmitted(String nsn) {
    if (widget.onSubmitted == null) {
      return;
    }
    widget.onSubmitted!(_effectiveController.country, nsn);
  }

  void _countryFieldSubmitted(Country? country) {
    if (widget.onSubmitted == null) {
      return;
    }
    widget.onSubmitted!(country, _effectiveController.nsn);
  }

  void _onNsnProxyNotify() {
    _onInternalNsnChange(_nsnProxyController.text);
  }

  void _onCountryProxyNotify() {
    _onInternalCountryChange(_countryProxyController.country);
  }

  void _onInternalNsnChange(String nsn) {
    _unregisterPhoneEditingControllerListeners();
    _effectiveController.nsn = nsn;
    _registerPhoneEditingControllerListeners();
  }

  void _onInternalCountryChange(Country? country) {
    _unregisterPhoneEditingControllerListeners();
    _effectiveController.country = country;
    _mayAutoFormat();
    _registerPhoneEditingControllerListeners();
  }

  void _onExternallyPhoneChange() {
    _unregisterNsnProxyControllerListeners();
    _unregisterCountryProxyControllerListeners();
    _nsnProxyController.text = _effectiveController.nsn;
    _countryProxyController.country = _effectiveController.country;
    _mayAutoFormat();
    _registerNsnProxyControllerListeners();
    _registerCountryProxyControllerListeners();
  }

  void _unregisterNsnProxyControllerListeners() {
    _nsnProxyController.removeListener(_onNsnProxyNotify);
  }

  void _registerNsnProxyControllerListeners() {
    _nsnProxyController.addListener(_onNsnProxyNotify);
  }

  void _unregisterCountryProxyControllerListeners() {
    _countryProxyController.removeListener(_onCountryProxyNotify);
  }

  void _registerCountryProxyControllerListeners() {
    _countryProxyController.addListener(_onCountryProxyNotify);
  }

  void _unregisterPhoneEditingControllerListeners() {
    _effectiveController.removeListener(_onExternallyPhoneChange);
  }

  void _registerPhoneEditingControllerListeners() {
    _effectiveController.addListener(_onExternallyPhoneChange);
  }

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _createLocalController();
      _registerController();
    }
    _registerPhoneEditingControllerListeners();
    _registerNsnProxyControllerListeners();
    _registerCountryProxyControllerListeners();
  }

  @override
  void didUpdateWidget(PhoneField oldWidget) {
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

  void _createLocalController([PhoneEditingValue? value]) {
    assert(_controller == null);
    _controller =
        value == null
            ? RestorablePhoneEditingController()
            : RestorablePhoneEditingController.fromValue(value);

    if (!restorePending) {
      _registerController();
    }
  }

  double _calcPhoneCodeWidthAsAText({
    required TextDirection directionality,
    required TextScaler textScaler,
    required TextStyle style,
  }) {
    final size =
        (TextPainter(
          text: TextSpan(text: '+999', style: style),
          maxLines: 1,
          textScaler: textScaler,
          textDirection: directionality,
        )..layout()).size;
    return size.width;
  }

  @override
  String? get restorationId => widget.restorationId;

  @override
  void dispose() {
    _nsnProxyController.dispose();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final directionality = Directionality.of(context);
    final textStyle =
        widget.style ?? TextTheme.of(context).bodyLarge ?? TextStyle();

    Widget countryField = CountryField(
      groupId: widget.groupId,
      decoration: InputDecoration(border: InputBorder.none),
      restorationId: 'country',
      countries: widget.countries,
      style: textStyle,
      enabled: widget.enabled,
      keyboardType: widget.keyboardType,
      maxLines: 1,
      type: CountryFieldType.plusSignPrefixedPhoneCode,
      onChanged: _countryFieldChange,
      onSubmitted: _countryFieldSubmitted,
      controller: _countryProxyController,
    );

    var countryFieldMaxWidth = _calcPhoneCodeWidthAsAText(
      textScaler: MediaQuery.of(context).textScaler,
      directionality: directionality,
      style: textStyle,
    );

    countryFieldMaxWidth *= 1.3;

    countryField = IntrinsicWidth(
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: countryFieldMaxWidth),
        child: countryField,
      ),
    );

    Widget buildTextField(
      BuildContext context,
      PhoneEditingValue value,
      Widget? _,
    ) {
      return TextField(
        groupId: widget.groupId,
        decoration: InputDecoration(
          border: InputBorder.none,
          counter: const SizedBox.shrink(),
        ),
        restorationId: 'nsn',
        autocorrect: false,
        maxLines: 1,
        controller: _nsnProxyController,
        onSubmitted: _nsnFieldSubmitted,
        onChanged: _nsnFieldChange,
        maxLength:
            widget.autoFormat
                ? value.country?.format?.length ?? widget.maxNsnLength
                : widget.maxNsnLength,
        spellCheckConfiguration: widget.spellCheckConfiguration,
        minLines: null,
        focusNode: widget.focusNode,
        enabled: widget.enabled,
        keyboardType: widget.keyboardType,
        onTapOutside: widget.onTapOutside,
        onEditingComplete: widget.onEditingComplete,
        onTap: widget.onTap,
        style: widget.style,
        autofocus: widget.autofocus,
        inputFormatters: [
          if (widget.autoFormat)
            _DefaultPhoneFieldNsnInputFormatter(_effectiveController),
          ...widget.inputFormatters,
        ],
      );
    }

    Widget nsnField;

    if (widget.autoFormat) {
      nsnField = ValueListenableBuilder(
        valueListenable: _effectiveController,
        builder: buildTextField,
      );
    } else {
      nsnField = buildTextField(context, _effectiveController.value, null);
    }

    nsnField = Expanded(child: nsnField);

    var row = <Widget>[countryField, const VerticalDivider(), nsnField];

    switch (directionality) {
      case TextDirection.rtl:
        row = row.reversed.toList();
      case TextDirection.ltr:
        break;
    }

    final Widget content = IntrinsicHeight(child: Row(children: row));

    return ValueListenableBuilder(
      valueListenable: _effectiveController,
      builder: (context, value, child) {
        return InputDecorator(
          expands: widget.expands,
          decoration: widget.decoration,
          isEmpty: value.country == null && value.nsn.isEmpty,
          child: child,
        );
      },
      child: content,
    );
  }
}

@freezed
class PhoneEditingValue with _$PhoneEditingValue {
  const factory PhoneEditingValue({Country? country, @Default('') String nsn}) =
      _PhoneEditingValue;
  const PhoneEditingValue._();

  static const empty = PhoneEditingValue();
}

final class PhoneEditingController extends ValueNotifier<PhoneEditingValue> {
  PhoneEditingController({Country? country, String nsn = ''})
    : super(PhoneEditingValue(country: country, nsn: nsn));

  PhoneEditingController.fromValue(super._value);

  Country? get country => value.country;
  String get nsn => value.nsn;

  set country(Country? newCountry) =>
      value = value.copyWith(country: newCountry);
  set nsn(String newNsn) => value = value.copyWith(nsn: newNsn);

  void clear() {
    value = PhoneEditingValue.empty;
  }
}

class _DefaultPhoneFieldNsnInputFormatter extends TextInputFormatter {
  _DefaultPhoneFieldNsnInputFormatter(this.controller);

  final PhoneEditingController controller;

  /// If null, doesn't provide formatting.
  Iterable<int>? get spacePositions =>
      controller.country?.format
          ?.replaceAll(_oneAndMoreSpaces, ' ')
          .allIndexOf(_oneAndMoreSpaces)
          .toSet();

  int? get xCount => controller.country?.format?.count('X');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (!newValue.composing.isCollapsed) {
      return newValue;
    }

    final isTextAdded = oldValue.text.length < newValue.text.length;

    if (isTextAdded) {
      return _format(newValue);
    }

    return newValue;
  }

  TextEditingValue _format(TextEditingValue value) {
    final spacePositions = this.spacePositions;
    final xCount = this.xCount;

    if (spacePositions == null) {
      return value;
    }

    final unformatted = value.text.replaceAll(_oneAndMoreNonDigit, '');
    var withSpacesInRightPlaces = unformatted.substring(
      0,
      xCount == null ? null : min(xCount, unformatted.length),
    );

    for (final idx in spacePositions) {
      if (idx < withSpacesInRightPlaces.length) {
        withSpacesInRightPlaces = withSpacesInRightPlaces.insert(idx, ' ');
      }
    }

    return TextEditingValue(
      text: withSpacesInRightPlaces,
      selection: TextSelection.collapsed(
        offset: withSpacesInRightPlaces.length,
      ),
      composing: TextRange.collapsed(-1),
    );
  }
}

extension on String {
  Iterable<int> allIndexOf(Pattern pattern) {
    final allMatches = pattern.allMatches(this);
    return allMatches.map((e) {
      return e.start;
    });
  }

  String insert(int idx, String other) {
    return substring(0, idx) + other + substring(idx);
  }

  int count(Pattern pattern) => pattern.allMatches(this).length;
}

typedef PhoneFormFieldResult = (Country?, String);

class PhoneFormField extends FormField<PhoneFormFieldResult> {
  PhoneFormField({
    required List<Country> countries,
    super.key,
    this.groupId = EditableText,
    this.controller,
    (Country?, String)? initialValue,
    FocusNode? focusNode,
    super.forceErrorText,
    InputDecoration? decoration = const InputDecoration(),
    TextInputType keyboardType = TextInputType.number,
    TextStyle? style,
    int? maxLines = 1,
    int? minLines,
    bool expands = false,
    int? maxLength,
    this.onChanged,
    GestureTapCallback? onTap,
    VoidCallback? onEditingComplete,
    void Function(Country?, String)? onFieldSubmitted,
    super.onSaved,
    super.validator,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
    TapRegionCallback? onTapOutside,
    bool autofocus = false,
    super.restorationId,
    super.autovalidateMode,
    SpellCheckConfiguration? spellCheckConfiguration,
  }) : assert(initialValue == null || controller == null),
       assert(maxLines == null || maxLines > 0),
       assert(minLines == null || minLines > 0),
       assert(
         (maxLines == null) || (minLines == null) || (maxLines >= minLines),
         "minLines can't be greater than maxLines",
       ),
       assert(
         !expands || (maxLines == null && minLines == null),
         'minLines and maxLines must be null when expands is true.',
       ),
       assert(
         maxLength == null ||
             maxLength == TextField.noMaxLength ||
             maxLength > 0,
       ),
       super(
         initialValue:
             controller != null
                 ? (controller.country, controller.nsn)
                 : (initialValue ?? const (null, '')),
         enabled: enabled ?? decoration?.enabled ?? true,
         builder: (FormFieldState<PhoneFormFieldResult> field) {
           final state = field as _PhoneFormFieldState;
           final effectiveDecoration = (decoration ?? const InputDecoration())
               .applyDefaults(Theme.of(field.context).inputDecorationTheme);

           void onChangedHandler(Country? country, String nsn) {
             field.didChange((country, nsn));
             onChanged?.call((country, nsn));
           }

           return UnmanagedRestorationScope(
             bucket: field.bucket,
             child: PhoneField(
               groupId: groupId,
               restorationId: restorationId,
               controller: state._effectiveController,
               focusNode: focusNode,
               decoration: effectiveDecoration.copyWith(
                 errorText: field.errorText,
               ),
               keyboardType: keyboardType,
               style: style,
               autofocus: autofocus,
               expands: expands,
               onChanged: onChangedHandler,
               onTap: onTap,
               onTapOutside: onTapOutside,
               onEditingComplete: onEditingComplete,
               onSubmitted: onFieldSubmitted,
               inputFormatters: inputFormatters ?? const [],
               enabled: enabled ?? decoration?.enabled ?? true,
               spellCheckConfiguration: spellCheckConfiguration,
               countries: countries,
             ),
           );
         },
       );

  /// Controls the phone being edited.
  ///
  /// If null, this widget will create its own [PhoneEditingController] and
  /// initialize its [PhoneEditingController.nsn] with [nsnInitialValue].
  final PhoneEditingController? controller;

  /// {@macro flutter.widgets.editableText.groupId}
  final Object groupId;

  /// {@template flutter.material.TextFormField.onChanged}
  /// Called when the user initiates a change to the TextField's
  /// value: when they have inserted or deleted text or reset the form.
  /// {@endtemplate}
  final ValueChanged<PhoneFormFieldResult>? onChanged;

  @override
  FormFieldState<PhoneFormFieldResult> createState() => _PhoneFormFieldState();
}

class _PhoneFormFieldState extends FormFieldState<PhoneFormFieldResult> {
  RestorablePhoneEditingController? _controller;

  PhoneEditingController get _effectiveController =>
      _phoneFormField.controller ?? _controller!.value;

  PhoneFormField get _phoneFormField => super.widget as PhoneFormField;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    super.restoreState(oldBucket, initialRestore);
    if (_controller != null) {
      _registerController();
    }
    // Make sure to update the internal [FormFieldState] value to sync up with
    // text editing controller value.
    setValue(_effectiveController.asFormFieldResult);
  }

  void _registerController() {
    assert(_controller != null);
    registerForRestoration(_controller!, 'controller');
  }

  void _createLocalController([PhoneEditingValue? value]) {
    assert(_controller == null);
    _controller =
        value == null
            ? RestorablePhoneEditingController()
            : RestorablePhoneEditingController.fromValue(value);
    if (!restorePending) {
      _registerController();
    }
  }

  @override
  void initState() {
    super.initState();
    if (_phoneFormField.controller == null) {
      _createLocalController(
        widget.initialValue != null
            ? PhoneEditingValue(
              country: widget.initialValue!.$1,
              nsn: widget.initialValue!.$2,
            )
            : null,
      );
    } else {
      _phoneFormField.controller!.addListener(_handleControllerChanged);
    }
  }

  @override
  void didUpdateWidget(PhoneFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_phoneFormField.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      _phoneFormField.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && _phoneFormField.controller == null) {
        _createLocalController(oldWidget.controller!.value);
      }

      if (_phoneFormField.controller != null) {
        setValue(_phoneFormField.controller!.asFormFieldResult);
        if (oldWidget.controller == null) {
          unregisterFromRestoration(_controller!);
          _controller!.dispose();
          _controller = null;
        }
      }
    }
  }

  @override
  void dispose() {
    _phoneFormField.controller?.removeListener(_handleControllerChanged);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChange(PhoneFormFieldResult? value) {
    super.didChange(value);

    if (_effectiveController.asFormFieldResult != value) {
      _effectiveController.value = PhoneEditingValue(
        country: value?.$1,
        nsn: value?.$2 ?? '',
      );
    }
  }

  @override
  void reset() {
    // Set the controller value before calling super.reset() to let
    // _handleControllerChanged suppress the change.
    _effectiveController.value = PhoneEditingValue(
      country: widget.initialValue?.$1,
      nsn: widget.initialValue?.$2 ?? '',
    );
    super.reset();
    _phoneFormField.onChanged?.call(_effectiveController.asFormFieldResult);
  }

  void _handleControllerChanged() {
    // Suppress changes that originated from within this class.
    //
    // In the case where a controller has been passed in to this widget, we
    // register this change listener. In these cases, we'll also receive change
    // notifications for changes originating from within this class -- for
    // example, the reset() method. In such cases, the FormField value will
    // already have been set.
    if (_effectiveController.asFormFieldResult != value) {
      didChange(_effectiveController.asFormFieldResult);
    }
  }
}

extension on PhoneEditingController {
  PhoneFormFieldResult get asFormFieldResult => (country, nsn);
}
