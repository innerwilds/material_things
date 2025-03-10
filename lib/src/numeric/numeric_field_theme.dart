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

@freezed
class NumericFieldThemeData with _$NumericFieldThemeData {
  const factory NumericFieldThemeData({
    required WidgetStateProperty<double> gap,
    required WidgetStateProperty<Color> backgroundColor,
    required WidgetStateProperty<TextStyle> textStyle,
  }) = _NumericFieldThemeData;
}
