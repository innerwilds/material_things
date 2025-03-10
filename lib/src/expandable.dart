import 'package:flutter/material.dart';

/// A shorthand for [AnimatedSwitcher] with size transition.
///
/// The [child] will be wrapped in [KeyedSubtree] and [expanded] passed to it
/// as [KeyedSubtree.key].
class Expandable extends StatefulWidget {
  /// Main ctor.
  const Expandable({
    required this.child,
    required this.expandingDuration,
    required this.shrinkingDuration,
    required this.expandingCurve,
    required this.shrinkingCurve,
    this.expanded = false,
    super.key,
  });

  final Widget child;
  final bool expanded;
  final Duration expandingDuration;
  final Duration shrinkingDuration;
  final Curve expandingCurve;
  final Curve shrinkingCurve;

  @override
  State<Expandable> createState() => _ExpandableState();
}

class _ExpandableState extends State<Expandable> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: widget.expandingDuration,
      reverseDuration: widget.shrinkingDuration,
      switchInCurve: widget.expandingCurve,
      switchOutCurve: widget.shrinkingCurve,
      transitionBuilder: (child, animation) {
        return SizeTransition(sizeFactor: animation, child: child);
      },
      child: KeyedSubtree(key: ValueKey(widget.expanded), child: widget.child),
    );
  }
}
