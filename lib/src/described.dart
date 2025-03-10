import 'package:flutter/material.dart';
import 'package:flutter_things/flutter_things.dart';

import 'described_theme.dart';

/// Where to place description for [DescribedWidget].
/// Example (content is Button):
///      top:          Click It
///             +------------------+
///             +      Click Me    +
///             +------------------+
///      start (ltr): it is indented to show from where we want to open sidebar.
///                   The arrow is description.
///                 +------------------+
///       <-------  +  Open Sidebar    +
///                 +------------------+
enum DescriptionAlignment {
  /// Place at the top of something.
  top,

  /// Place at the bottom of something/
  bottom,

  /// Place at the end of something.
  end,

  /// Place at the start of something.
  start,
}

/// Something described by [description].
class DescribedWidget extends StatelessWidget {
  /// Main ctor.
  const DescribedWidget({
    required this.alignment,
    required this.description,
    required this.content,
    this.spacing,
    this.descriptionStyle,
    super.key,
  });

  /// Will be [kDefaultDescribedSpacing] if it is and
  /// [DescribedTheme.spacing] is null.
  final double? spacing;

  /// Will be [TextTheme.bodyMedium] if it is and
  /// [DescribedTheme.descriptionStyle] is null.
  final TextStyle? descriptionStyle;

  /// Description of [content].
  final Widget description;

  /// The content.
  final Widget content;

  /// Alignment.
  final DescriptionAlignment alignment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ourTheme =
        theme.extension<DescribedTheme>() ?? const DescribedTheme();

    final spacing =
        this.spacing ?? ourTheme.spacing ?? kDefaultDescribedSpacing;
    final descriptionStyle =
        this.descriptionStyle ??
        ourTheme.descriptionStyle ??
        theme.textTheme.bodyMedium;

    var descriptionWidget = description;

    if (descriptionStyle != null) {
      descriptionWidget = DefaultTextStyle(
        style: descriptionStyle,
        child: descriptionWidget,
      );
    }

    final Widget content = switch (alignment) {
      DescriptionAlignment.top => Column(
        mainAxisSize: MainAxisSize.min,
        children: [descriptionWidget, VertGap(spacing), this.content],
      ),
      DescriptionAlignment.bottom => Column(
        mainAxisSize: MainAxisSize.min,
        children: [this.content, VertGap(spacing), descriptionWidget],
      ),
      DescriptionAlignment.start => Row(
        mainAxisSize: MainAxisSize.min,
        children: [descriptionWidget, VertGap(spacing), this.content],
      ),
      DescriptionAlignment.end => Row(
        mainAxisSize: MainAxisSize.min,
        children: [this.content, VertGap(spacing), descriptionWidget],
      ),
    };

    return content;
  }
}
