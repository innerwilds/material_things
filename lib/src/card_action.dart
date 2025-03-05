import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_action.freezed.dart';

const _defaulTheme = CardActionThemeData(
  padding: WidgetStatePropertyAll(
    EdgeInsets.symmetric(horizontal: 8, vertical: 16),
  ),
  textStyle: null,
);

@freezed
class CardActionThemeData with _$CardActionThemeData {
  const factory CardActionThemeData({
    WidgetStateProperty<EdgeInsets>? padding,
    WidgetStateProperty<TextStyle>? textStyle,
  }) = _CardActionThemeData;
}

class CardActionTheme extends InheritedTheme {
  const CardActionTheme({required super.child, required this.data, super.key});

  final CardActionThemeData data;

  static CardActionThemeData of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<CardActionTheme>();
    assert(result != null, 'No CardActionTheme found in context');
    return result!.data;
  }

  static CardActionThemeData? maybeOf(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<CardActionTheme>();
    return result?.data;
  }

  @override
  bool updateShouldNotify(CardActionTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return CardActionTheme(data: data, child: child);
  }
}

class CardAction extends StatelessWidget {
  const CardAction({required this.child, required this.onPressed, super.key});

  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = CardActionTheme.maybeOf(context) ?? _defaulTheme;
    final padding =
        (theme.padding ?? _defaulTheme.padding)?.resolve({}) ?? EdgeInsets.zero;
    final textStyle =
        (theme.textStyle ?? _defaulTheme.textStyle)?.resolve({}) ??
        TextTheme.of(context).labelMedium;

    var content = child;

    if (textStyle != null) {
      content = DefaultTextStyle(style: textStyle, child: content);
    }

    return InkWell(
      onTap: onPressed,
      child: Padding(padding: padding, child: content),
    );
  }
}
