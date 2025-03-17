import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Works as [ImplicitlyAnimatedWidget].
///
/// Animation will happen on any parameter change. Just change the [key] to
/// animate.
class AutoAnimatedIcon extends ImplicitlyAnimatedWidget {
  /// Main ctor.
  const AutoAnimatedIcon({
    required super.duration,
    required this.icon,
    super.key,
    super.curve = Curves.decelerate,
    this.color,
    this.size,
    this.semanticLabel,
    this.textDirection,
  });

  /// The color to use when drawing the icon.
  ///
  /// Defaults to the current [IconTheme] color, if any.
  ///
  /// The given color will be adjusted by the opacity of the current
  /// [IconTheme], if any.
  ///
  /// In material apps, if there is a [Theme] without any [IconTheme]s
  /// specified, icon colors default to white if the theme is dark
  /// and black if the theme is light.
  ///
  /// If no [IconTheme] and no [Theme] is specified, icons will default to black.
  ///
  /// See [Theme] to set the current theme and [ThemeData.brightness]
  /// for setting the current theme's brightness.
  final Color? color;

  /// The size of the icon in logical pixels.
  ///
  /// Icons occupy a square with width and height equal to size.
  ///
  /// Defaults to the current [IconTheme] size.
  final double? size;

  /// The icon to display. Available icons are listed in [AnimatedIcons].
  final AnimatedIconData icon;

  /// Semantic label for the icon.
  ///
  /// Announced by assistive technologies (e.g TalkBack/VoiceOver).
  /// This label does not show in the UI.
  ///
  /// See also:
  ///
  ///  * [SemanticsProperties.label], which is set to [semanticLabel] in the
  ///    underlying [Semantics] widget.
  final String? semanticLabel;

  /// The text direction to use for rendering the icon.
  ///
  /// If this is null, the ambient [Directionality] is used instead.
  ///
  /// If the text direction is [TextDirection.rtl], the icon will be mirrored
  /// horizontally (e.g back arrow will point right).
  final TextDirection? textDirection;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Curve>('curve', curve));
  }

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() {
    return _AutoAnimatedIconState();
  }
}

class _AutoAnimatedIconState
    extends ImplicitlyAnimatedWidgetState<AutoAnimatedIcon> {
  late Animation<double> _curved;

  @override
  void initState() {
    super.initState();
    _curved = Animation.fromValueListenable(
      animation,
      transformer: (a) {
        return widget.curve.transform(a);
      },
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {}

  @override
  Widget build(BuildContext context) {
    return AnimatedIcon(progress: _curved, icon: widget.icon);
  }
}
