import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:material_things/material_things.dart';

/// Default described spacing.
const kDefaultDescribedSpacing = 10.0;

/// Theme for [DescribedWidget].
class DescribedTheme extends ThemeExtension<DescribedTheme> {
  /// Main ctor.
  const DescribedTheme({
    this.spacing = kDefaultDescribedSpacing,
    this.descriptionStyle,
  });

  /// Spacing between content and description.
  final double? spacing;

  /// Description color.
  final TextStyle? descriptionStyle;

  @override
  ThemeExtension<DescribedTheme> lerp(DescribedTheme? other, double t) {
    return DescribedTheme(
      spacing: lerpDouble(spacing, other?.spacing, t),
      descriptionStyle: TextStyle.lerp(
        descriptionStyle,
        other?.descriptionStyle,
        t,
      ),
    );
  }

  @override
  ThemeExtension<DescribedTheme> copyWith({
    double? spacing,
    TextStyle? descriptionStyle,
  }) {
    return DescribedTheme(
      spacing: spacing ?? this.spacing,
      descriptionStyle: descriptionStyle ?? this.descriptionStyle,
    );
  }
}
