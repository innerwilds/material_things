import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'numeric_field_theme.freezed.dart';

class NumericFieldTheme extends InheritedTheme {
  const NumericFieldTheme({
    required super.child,
    required this.data,
    super.key,
  });

  final NumericFieldThemeData data;

  static NumericFieldThemeData? maybeOf(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<NumericFieldTheme>();
    return result?.data;
  }

  @override
  bool updateShouldNotify(NumericFieldTheme old) {
    return old.data != data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return NumericFieldTheme(data: data, child: child);
  }
}

@Freezed(copyWith: false)
class NumericFieldThemeData extends ThemeExtension<NumericFieldThemeData>
    with _$NumericFieldThemeData {
  const NumericFieldThemeData({this.gap, this.backgroundColor, this.textStyle});

  final WidgetStateProperty<double?>? gap;
  final WidgetStateProperty<Color?>? backgroundColor;
  final WidgetStateProperty<TextStyle?>? textStyle;

  @override
  NumericFieldThemeData copyWith({
    WidgetStateProperty<double>? gap,
    WidgetStateProperty<Color>? backgroundColor,
    WidgetStateProperty<TextStyle>? textStyle,
  }) {
    return NumericFieldThemeData(
      gap: gap ?? this.gap,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  ThemeExtension<NumericFieldThemeData> lerp(
    NumericFieldThemeData? other,
    double t,
  ) {
    return NumericFieldThemeData(
      gap: WidgetStateProperty.lerp<double?>(gap, other?.gap, t, lerpDouble),
      backgroundColor: WidgetStateProperty.lerp<Color?>(
        backgroundColor,
        other?.backgroundColor,
        t,
        Color.lerp,
      ),
      textStyle: WidgetStateProperty.lerp<TextStyle?>(
        textStyle,
        other?.textStyle,
        t,
        TextStyle.lerp,
      ),
    );
  }
}
