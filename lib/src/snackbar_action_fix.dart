import 'package:flutter/material.dart';

/// A button for a [SnackBar], known as an "action".
///
/// Snack bar actions are always enabled. Instead of disabling a snack bar
/// action, avoid including it in the snack bar in the first place.
///
/// Snack bar actions can only be pressed once. Subsequent presses are ignored.
///
/// See also:
///
///  * [SnackBar]
///  * <https://material.io/design/components/snackbars.html>
class SnackBarActionWithFix extends SnackBarAction {
  /// Creates an action for a [SnackBar].
  const SnackBarActionWithFix({
    required this.labelWidget,
    required super.onPressed,
    super.key,
    super.textColor,
    super.disabledTextColor,
    super.backgroundColor,
    super.disabledBackgroundColor,
  }) : assert(
         backgroundColor is! MaterialStateColor ||
             disabledBackgroundColor == null,
         'disabledBackgroundColor must not be provided when background color is '
         'a MaterialStateColor',
       ),
       super(label: '');

  final Widget labelWidget;

  @override
  State<SnackBarActionWithFix> createState() => _SnackBarActionState();
}

class _SnackBarActionState extends State<SnackBarActionWithFix> {
  bool _haveTriggeredAction = false;

  void _handlePressed() {
    if (_haveTriggeredAction) {
      return;
    }
    setState(() {
      _haveTriggeredAction = true;
    });
    widget.onPressed();
    ScaffoldMessenger.of(
      context,
    ).hideCurrentSnackBar(reason: SnackBarClosedReason.action);
  }

  @override
  Widget build(BuildContext context) {
    final SnackBarThemeData defaults = _SnackbarDefaultsM3(context);
    final snackBarTheme = Theme.of(context).snackBarTheme;

    WidgetStateColor resolveForegroundColor() {
      if (widget.textColor != null) {
        if (widget.textColor is WidgetStateColor) {
          return widget.textColor! as MaterialStateColor;
        }
      } else if (snackBarTheme.actionTextColor != null) {
        if (snackBarTheme.actionTextColor is MaterialStateColor) {
          return snackBarTheme.actionTextColor! as MaterialStateColor;
        }
      } else if (defaults.actionTextColor != null) {
        if (defaults.actionTextColor is MaterialStateColor) {
          return defaults.actionTextColor! as MaterialStateColor;
        }
      }

      return MaterialStateColor.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return widget.disabledTextColor ??
              snackBarTheme.disabledActionTextColor ??
              defaults.disabledActionTextColor!;
        }
        return widget.textColor ??
            snackBarTheme.actionTextColor ??
            defaults.actionTextColor!;
      });
    }

    MaterialStateColor? resolveBackgroundColor() {
      if (widget.backgroundColor is MaterialStateColor) {
        return widget.backgroundColor! as MaterialStateColor;
      }
      if (snackBarTheme.actionBackgroundColor is MaterialStateColor) {
        return snackBarTheme.actionBackgroundColor! as MaterialStateColor;
      }
      return MaterialStateColor.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return widget.disabledBackgroundColor ??
              snackBarTheme.disabledActionBackgroundColor ??
              Colors.transparent;
        }
        return widget.backgroundColor ??
            snackBarTheme.actionBackgroundColor ??
            Colors.transparent;
      });
    }

    return TextButton(
      style: TextButton.styleFrom(
        overlayColor: resolveForegroundColor(),
      ).copyWith(
        foregroundColor: resolveForegroundColor(),
        backgroundColor: resolveBackgroundColor(),
      ),
      onPressed: _haveTriggeredAction ? null : _handlePressed,
      child: widget.labelWidget,
    );
  }
}

class _SnackbarDefaultsM3 extends SnackBarThemeData {
  _SnackbarDefaultsM3(this.context);

  final BuildContext context;
  late final ThemeData _theme = Theme.of(context);
  late final ColorScheme _colors = _theme.colorScheme;

  @override
  Color get backgroundColor => _colors.inverseSurface;

  @override
  Color get actionTextColor =>
      MaterialStateColor.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return _colors.inversePrimary;
        }
        if (states.contains(MaterialState.pressed)) {
          return _colors.inversePrimary;
        }
        if (states.contains(MaterialState.hovered)) {
          return _colors.inversePrimary;
        }
        if (states.contains(MaterialState.focused)) {
          return _colors.inversePrimary;
        }
        return _colors.inversePrimary;
      });

  @override
  Color get disabledActionTextColor => _colors.inversePrimary;

  @override
  TextStyle get contentTextStyle => Theme.of(
    context,
  ).textTheme.bodyMedium!.copyWith(color: _colors.onInverseSurface);

  @override
  double get elevation => 6;

  @override
  ShapeBorder get shape => const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
  );

  @override
  SnackBarBehavior get behavior => SnackBarBehavior.fixed;

  @override
  EdgeInsets get insetPadding => const EdgeInsets.fromLTRB(15, 5, 15, 10);

  @override
  bool get showCloseIcon => false;

  @override
  Color? get closeIconColor => _colors.onInverseSurface;

  @override
  double get actionOverflowThreshold => 0.25;
}
