import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_things/flutter_things.dart';

// Not a clean, but works.

typedef VirtualKeyboardController = StreamController<KeyEvent>;

final class _Key {
  const _Key(this.number, this.abc, this.lkk, this.pkk);
  final String number;
  final String abc;
  final LogicalKeyboardKey lkk;
  final PhysicalKeyboardKey pkk;

  KeyDownEvent toDownEvent() {
    return KeyDownEvent(
      physicalKey: pkk,
      logicalKey: lkk,
      timeStamp: ServicesBinding.instance.currentSystemFrameTimeStamp,
      deviceType: KeyEventDeviceType.keyboard,
      character: number.isEmpty ? null : number,
    );
  }

  KeyUpEvent toUpEvent() {
    return KeyUpEvent(
      physicalKey: pkk,
      logicalKey: lkk,
      timeStamp: ServicesBinding.instance.currentSystemFrameTimeStamp,
      deviceType: KeyEventDeviceType.keyboard,
    );
  }
}

const _buttons = [
  [
    _Key('1', '', LogicalKeyboardKey.digit1, PhysicalKeyboardKey.digit1),
    _Key('2', 'ABC', LogicalKeyboardKey.digit2, PhysicalKeyboardKey.digit2),
    _Key('3', 'DEF', LogicalKeyboardKey.digit3, PhysicalKeyboardKey.digit3),
  ],
  [
    _Key('4', 'GHI', LogicalKeyboardKey.digit4, PhysicalKeyboardKey.digit4),
    _Key('5', 'JKL', LogicalKeyboardKey.digit5, PhysicalKeyboardKey.digit5),
    _Key('6', 'MNO', LogicalKeyboardKey.digit6, PhysicalKeyboardKey.digit6),
  ],
  [
    _Key('7', 'PQRS', LogicalKeyboardKey.digit7, PhysicalKeyboardKey.digit7),
    _Key('8', 'TUV', LogicalKeyboardKey.digit8, PhysicalKeyboardKey.digit8),
    _Key('9', 'WXYZ', LogicalKeyboardKey.digit9, PhysicalKeyboardKey.digit9),
  ],
  [
    null,
    _Key('0', '+', LogicalKeyboardKey.digit0, PhysicalKeyboardKey.digit0),
    _Key('', 'DEL', LogicalKeyboardKey.delete, PhysicalKeyboardKey.delete),
  ],
];

class UINumericKeyboard extends StatefulWidget {
  const UINumericKeyboard({
    required this.controller, super.key,
  });

  final VirtualKeyboardController controller;

  @override
  State<UINumericKeyboard> createState() => _UINumericKeyboardState();
}

class _UINumericKeyboardState extends State<UINumericKeyboard> {
  void _onNumberPressed(_Key key) async {
    final down = key.toDownEvent();
    final up = key.toUpEvent();

    switch (widget.controller) {
      case VirtualKeyboardController(add: final add):
        add(down);
        add(up);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget createButton(_Key key) {
      return FilledButton.tonal(
        style: ButtonStyle(
          elevation: WidgetStatePropertyAll(0),
          visualDensity: VisualDensity.comfortable,
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6)))),
        ),
        onPressed: () => _onNumberPressed(key),
        child: Row(
          children: [
            Text(key.number,
                style: TextTheme.of(context).bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),),
            const Spacer(),
            Opacity(
              opacity: 0.7,
              child: Text(key.abc, style: TextTheme.of(context).labelMedium),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final row in _buttons) ...[
          Expanded(
            child: SizedBox.expand(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (final key in row) ...[
                    Expanded(
                      child: key != null
                          ? createButton(key)
                          : SizedBox.shrink(),
                    ),
                    if (key != row.last) HorzGap(4),
                  ],
                ],
              ),
            ),
          ),
          if (row != _buttons.last) VertGap(4),
        ],
      ],
    );
  }
}