import 'package:flutter/material.dart';

/// Button, shown like a [TextField] using [InputDecorator].
///
/// Uses OutlinedButton style, but it can be override using [style],
/// or [Theme], [ButtonTheme].
class FieldButton extends StatefulWidget {
  const FieldButton({
    required this.onTap,
    required this.child,
    this.icon,
    super.key,
    this.focusNode,
    this.decoration,
    this.isEmpty = false,
  });

  final bool isEmpty;

  final Widget child;

  final Widget? icon;

  final FocusNode? focusNode;

  /// Decoration around button.
  final InputDecoration? decoration;

  /// Will be called when user taps on text field (button).
  final void Function() onTap;

  @override
  State<FieldButton> createState() => _FieldButtonState();
}

class _FieldButtonState extends State<FieldButton> {
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
    return InkWell(
      onTap: widget.onTap,
      customBorder: widget.decoration?.border,
      child: MouseRegion(
        onEnter: onMouseEnter,
        onExit: onMouseExit,
        child: InputDecorator(
          isEmpty: widget.isEmpty,
          isFocused: focusNode.hasFocus,
          isHovering: isHovering,
          decoration: (widget.decoration ?? const InputDecoration()).copyWith(
            prefixIcon: widget.icon,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
