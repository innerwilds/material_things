import 'package:flutter/material.dart';
import 'package:material_things/src/internal/field_button.dart';
import 'package:material_things/src/locales/locale.dart';

import 'locales.dart';
import 'locale_editing_controller.dart';

/// Shows currently selected country from [LocaleEditingController] as a
/// [TextField] using [InputDecorator] and makes it tappable as a [InkWell].
class LocaleButton extends StatefulWidget {
  const LocaleButton({
    required this.onTap,
    super.key,
    this.locale,
    this.controller,
    this.focusNode,
    this.decoration = const InputDecoration(
      border: OutlineInputBorder(),
      suffixIcon: Icon(Icons.arrow_forward_ios_rounded),
    ),
    this.additionalLocales,
  }) : assert(
         locale == null || controller == null,
         'You can use either controller or country, not both',
       );

  final FocusNode? focusNode;

  /// Decoration around button.
  final InputDecoration decoration;

  /// Country to show.
  final ExtendedLocale? locale;

  /// Controller with country to show with listening.
  ///
  /// The country will be not set automatically via controller,
  /// because it is just a button.
  final LocaleEditingController? controller;

  /// Additional countries to be show as flags.
  final List<ExtendedLocale>? additionalLocales;

  /// Will be called when user taps on text field (button).
  final void Function() onTap;

  @override
  State<LocaleButton> createState() => _LocaleButtonState();
}

class _LocaleButtonState extends State<LocaleButton> {
  ExtendedLocale? get _locale =>
      widget.controller != null ? widget.controller!.locale : widget.locale;

  FocusNode? _localFocusNode;
  FocusNode get focusNode {
    if (widget.focusNode == null) {
      return _localFocusNode ??= FocusNode()..addListener(onFocus);
    }
    if (_localFocusNode != null) {
      _localFocusNode!.dispose();
      _localFocusNode = null;
    }
    return widget.focusNode!;
  }

  bool isHovering = false;

  void onFocus() {
    setState(() {});
  }

  void onMouseEnter(_) {
    setState(() {
      isHovering = true;
    });
  }

  void onMouseExit(_) {
    setState(() {
      isHovering = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final aLocales = widget.additionalLocales;

    return FieldButton(
      isEmpty: _locale == null,
      decoration: widget.decoration,
      icon: AnimatedSwitcher(
        duration: kThemeAnimationDuration,
        child: Stack(
          clipBehavior: Clip.none,
          key: ValueKey(_locale?.countryEmoji),
          fit: StackFit.passthrough,
          alignment: Alignment.center,
          children: [
            if (aLocales != null)
              for (var i = aLocales.length ~/ 2 - 1; i > -1; i--)
                if (aLocales[i].countryCode != null)
                  Positioned(
                    left: -(i + 1).toDouble() * 5,
                    top: -(i + 1).toDouble() * 5,
                    child: Text(
                      aLocales[i].countryEmoji!,
                      textAlign: TextAlign.center,
                    ),
                  ),
            if (aLocales != null)
              for (var i = aLocales.length - 1; i > -1; i--)
                if (aLocales[i].countryCode != null)
                  Positioned(
                    left: (i - aLocales.length ~/ 2 + 1).toDouble() * 5,
                    top: (i - aLocales.length ~/ 2 + 1).toDouble() * 5,
                    child: Text(aLocales[i].countryEmoji!, textAlign: TextAlign.center),
                  ),
            Text(_locale?.countryEmoji ?? '🏴‍', textAlign: TextAlign.center),
          ],
        ),
      ),
      onTap: widget.onTap,
      child: Text(_locale?.nameLocal ?? ''),
    );
  }
}
