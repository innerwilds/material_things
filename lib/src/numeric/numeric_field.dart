import 'dart:math';

import 'package:collection/collection.dart';
import 'package:dart_things/dart_things.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'numeric_field_theme.dart';

part 'numeric_field.freezed.dart';

final notADigitRE = RegExp(r'\D');

enum AutomaticResizeMode {
  /// Tries to find size (width now).
  ///
  /// It might overflow.
  findSize,

  /// Tries to find size (width now).
  ///
  /// If it is can't, use [wrap].
  findSizeOrWrap,

  /// Wrap cells using [Wrap].
  wrap,

  /// Does nothing, if overflow take place you will see.
  none,
}

class NumericField extends StatefulWidget {
  const NumericField({
    super.key,
    this.decoration = const InputDecoration(border: OutlineInputBorder()),
    this.length,
    this.initialAutomaticLength = 6,
    this.automaticResizeMode = AutomaticResizeMode.findSize,
    this.keyboardType = TextInputType.number,
    this.onTapOutside,
    this.controller,
    this.onChanged,
    this.focusNode,
  });

  final FocusNode? focusNode;

  final void Function(BigInt)? onChanged;

  final NumericEditingController? controller;

  final AutomaticResizeMode automaticResizeMode;

  final void Function(PointerDownEvent)? onTapOutside;

  final TextInputType keyboardType;

  /// How many cells for digits create.
  ///
  /// If null there will be automatic cell creation.
  final int? length;

  /// If [length] is null, there will be automatic cell creation for
  /// new digits, and a skeleton [TextField] will appear to help user
  /// with it.
  final int initialAutomaticLength;

  final InputDecoration decoration;

  @override
  State<NumericField> createState() => _NumericFieldState();
}

class _NumericFieldState extends State<NumericField> {
  final List<FocusNode> focusNodes = [];
  final List<TextEditingController> controllers = [];

  FocusNode? automaticFocusNode;
  TextEditingController? automaticController;

  final ValueNotifier<List<int>> _invalidIndices = ValueNotifier([]);

  late int _automaticLength;
  int get length => widget.length ?? _automaticLength;
  bool get isAutomatic => widget.length == null;

  bool puttingFromExternal = false;

  String? buildStringNumberFromFields() {
    // ... or we can use multiplication ...
    var numberToParse = '';

    for (final controller in controllers) {
      controller.text = controller.text.replaceAll(notADigitRE, '');

      final character = controller.text.characters.firstOrNull;

      if (character == null) {
        return null;
      }

      if (int.tryParse(character) == null) {
        return null;
      } else {
        numberToParse += character;
      }
    }

    return numberToParse;
  }

  KeyEventResult onKeyEvent(FocusNode fn, KeyEvent event) {
    final idx = focusNodes.indexOf(fn);
    final controller = controllers[idx];

    if (event is KeyDownEvent || event is KeyRepeatEvent) {
      switch (event.logicalKey) {
        case LogicalKeyboardKey.arrowLeft:
          focusPrevious(idx);
          return KeyEventResult.handled;
        case LogicalKeyboardKey.arrowRight:
          focusNext(idx);
          return KeyEventResult.handled;
        case LogicalKeyboardKey.delete:
        case LogicalKeyboardKey.backspace:
          controller.text = '';
          focusPrevious(idx);
          return KeyEventResult.handled;
      }
    }

    if (event is KeyDownEvent) {
      switch (event.logicalKey) {
        case LogicalKeyboardKey.digit0:
        case LogicalKeyboardKey.digit1:
        case LogicalKeyboardKey.digit2:
        case LogicalKeyboardKey.digit3:
        case LogicalKeyboardKey.digit4:
        case LogicalKeyboardKey.digit5:
        case LogicalKeyboardKey.digit6:
        case LogicalKeyboardKey.digit7:
        case LogicalKeyboardKey.digit8:
        case LogicalKeyboardKey.digit9:
          controller.text = event.character!;
          focusNext(idx);
          return KeyEventResult.handled;
      }

      return KeyEventResult.ignored;
    }

    return KeyEventResult.ignored;
  }

  void putDigitIntoTextController(int idx, String digit) {}

  void putNewValueIntoTextControllers(String number) {
    puttingFromExternal = true;

    for (final (idx, character) in number.characters.indexed) {
      putDigitIntoTextController(idx, character);
    }

    puttingFromExternal = false;
  }

  void onControllerValueChanged() {
    final newValue = widget.controller!.number.toString();
    final currentValue = buildStringNumberFromFields();

    if (newValue != currentValue) {
      putNewValueIntoTextControllers(newValue);
    }
  }

  void onTextChanged() {
    if (puttingFromExternal) {
      return;
    }

    /// Blocking non-digits.
    for (final controller in controllers) {
      controller.text = controller.text.replaceAll(notADigitRE, '');
    }

    trimEnd();

    final numberToParse = buildStringNumberFromFields();

    if (numberToParse == null) {
      setIsInvalid();
      return;
    }

    final bigNumber = BigInt.tryParse(numberToParse);

    if (bigNumber == null) {
      setIsInvalid();
    } else {
      putAndOrEmitValue(bigNumber);
    }
  }

  void setIsInvalid() {
    final invalidIndices = <int>[];

    for (final (idx, c) in controllers.indexed) {
      if (c.text.isEmpty || notADigitRE.matchAsPrefix(c.text) != null) {
        invalidIndices.add(idx);
      }
    }

    _invalidIndices.value = invalidIndices;
  }

  void putAndOrEmitValue(BigInt value) {
    if (widget.onChanged != null) {
      widget.onChanged?.call(value);
    }

    unlistenExternalController();
    widget.controller?.number = value;
    listenExternalController();
  }

  void onAutomaticFocused() {
    moveAutomatic();
  }

  void moveAutomatic() {
    final focusNode = automaticFocusNode!;
    final controller = automaticController!;

    focusNode.removeListener(onAutomaticFocused);

    _automaticLength++;

    focusNodes.add(focusNode);
    controllers.add(controller);

    // To generate new automatics
    regenerateFocusNodes(true);
    regenerateControllers(true);

    setState(() {});
  }

  void focusPrevious(int idx) {
    final focusNode = idx >= 1 ? focusNodes[idx - 1] : null;
    focusNode?.requestFocus();
  }

  void focusNext(int idx) {
    final focusNode = idx + 1 < focusNodes.length ? focusNodes[idx + 1] : null;

    if (focusNode == null) {
      FocusScope.of(context).nextFocus();
    } else {
      focusNode.requestFocus();
    }
  }

  void onFocused() {
    final idx = focusNodes.indexWhere((fn) => fn.hasFocus);
    widget.controller?.focusedDigit = idx;
  }

  void regenerateFocusNodes([bool forceAutomatic = false]) {
    focusNodes.regenerate(
      newLength: length,
      generate:
          (_) => FocusNode(onKeyEvent: onKeyEvent)..addListener(onFocused),
      onRemove: (fn) {
        fn.removeListener(onFocused);
        fn.dispose();
      },
    );
    if (isAutomatic) {
      if (forceAutomatic || automaticFocusNode == null) {
        automaticFocusNode = FocusNode(onKeyEvent: onKeyEvent)
          ..addListener(onAutomaticFocused);
      }
    } else {
      automaticFocusNode?.removeListener(onAutomaticFocused);
      automaticFocusNode?.dispose();
      automaticFocusNode = null;
    }
  }

  void regenerateControllers([bool forceAutomatic = false]) {
    controllers.regenerate(
      newLength: length,
      generate: (i) {
        return TextEditingController()..addListener(onTextChanged);
      },
      onRemove: (tec) {
        tec.dispose();
      },
    );
    if (isAutomatic) {
      if (forceAutomatic || automaticController == null) {
        automaticController =
            TextEditingController()..addListener(onTextChanged);
      }
    } else {
      automaticController?.dispose();
      automaticController = null;
    }
  }

  FocusNode getFocusNode(int i) => focusNodes[i];
  TextEditingController getController(int i) => controllers[i];

  void onContentInserted(KeyboardInsertedContent content) {}

  void unlistenExternalController([NumericField? widget]) {
    (widget ?? this.widget).controller?.removeListener(
      onControllerValueChanged,
    );
  }

  void listenExternalController() {
    widget.controller?.addListener(onControllerValueChanged);
  }

  void trimEnd() {
    if (!isAutomatic) {
      return;
    }

    final direction = Directionality.of(context);

    switch (direction) {
      case TextDirection.rtl:
      case TextDirection.ltr:
        for (
          var i = controllers.length - 1;
          i >= widget.initialAutomaticLength;
          i--
        ) {
          final controller = controllers[i];

          if (controller.text.isEmpty) {
            _automaticLength--;
          }
        }
    }

    regenerateControllers();
    regenerateFocusNodes();
  }

  FocusNode? findFocusedNode() {
    return focusNodes.firstWhereOrNull((node) {
      return node.hasFocus;
    });
  }

  KeyEventResult onExternalFocusNodeKeyEvent(FocusNode fn, KeyEvent event) {
    final node = findFocusedNode();
    if (node == null) return KeyEventResult.ignored;
    return onKeyEvent(node, event);
  }

  void onValidationTrigger() {
    // TODO(innerwilds): we need internal NumericEditingController too
    // TODO(innerwilds): we need to validate controller.number and gaps
    // TODO(innerwilds): we need to validate it using widget.validate
    // For now we just shake it.
  }

  @override
  void initState() {
    super.initState();
    _automaticLength = widget.initialAutomaticLength;

    widget.focusNode?.onKeyEvent = onExternalFocusNodeKeyEvent;

    regenerateFocusNodes();
    regenerateControllers();
    listenExternalController();
  }

  @override
  void didUpdateWidget(covariant NumericField oldWidget) {
    super.didUpdateWidget(oldWidget);

    regenerateFocusNodes();
    regenerateControllers();

    if (oldWidget.controller != widget.controller) {
      unlistenExternalController(oldWidget);
      listenExternalController();
    }

    if (oldWidget.focusNode != widget.focusNode) {
      oldWidget.focusNode?.onKeyEvent = null;
      widget.focusNode?.onKeyEvent = onExternalFocusNodeKeyEvent;
    }
  }

  @override
  void dispose() {
    unlistenExternalController();
    if (widget.focusNode?.onKeyEvent == onExternalFocusNodeKeyEvent) {
      widget.focusNode?.onKeyEvent = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugCheckHasDirectionality(context);
    final theme =
        NumericFieldTheme.maybeOf(context) ??
        NumericFieldThemeData(
          gap: WidgetStatePropertyAll(8),
          backgroundColor: WidgetStatePropertyAll(Colors.transparent),
          textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16, height: 2)),
        );

    final textStyle = theme.textStyle.resolve({});

    assert(
      textStyle.fontSize != null,
      'TextStyle.fontSize must not be null when using with NumericField',
    );

    Widget buildCell(
      FocusNode fn,
      TextEditingController tec,
      double width,
      double fontSize,
    ) {
      return SizedBox(
        width: width,
        child: TextField(
          decoration: widget.decoration.copyWith(counter: SizedBox.shrink()),
          style: textStyle.copyWith(fontSize: fontSize),
          keyboardType: widget.keyboardType,
          onTapOutside: widget.onTapOutside,
          focusNode: fn,
          controller: tec,
          maxLines: 1,
          maxLength: 1,
          spellCheckConfiguration: SpellCheckConfiguration.disabled(),
          autocorrect: false,
          contentInsertionConfiguration: ContentInsertionConfiguration(
            onContentInserted: onContentInserted,
          ),
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
        ),
      );
    }

    double getWidth(double fontSize, double coef) {
      return max(fontSize * coef, 40);
    }

    double calcOccupied(double cellWidth, double spacing) {
      final cellsCount = length + (isAutomatic ? 1 : 0);
      return cellsCount * cellWidth + (cellsCount - 1) * spacing;
    }

    (double, double) findSizes(
      double maxWidth,
      double fontSize,
      double preferredSpacing,
      double preferredCoef,
    ) {
      var from = 1.0;
      const to = 0.5;
      const step = 0.01;
      var spacing = preferredSpacing;
      var coef = preferredCoef;
      var width = getWidth(fontSize, coef);

      while (from > to && calcOccupied(width, spacing) > maxWidth) {
        coef = preferredCoef * from;
        width = getWidth(fontSize, coef);
        spacing = preferredSpacing * from;
        from -= step;
      }

      return (spacing, coef);
    }

    final Widget content = LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        final preferredSpacing = theme.gap.resolve({});
        const preferredCoef = 1.6;
        final fontSize = textStyle.fontSize!;

        var spacing = preferredSpacing;
        var coef = preferredCoef;

        final initialOccupied = calcOccupied(getWidth(fontSize, coef), spacing);

        var wrap = false;

        if (initialOccupied > maxWidth) {
          switch (widget.automaticResizeMode) {
            case AutomaticResizeMode.findSizeOrWrap:
            case AutomaticResizeMode.findSize:
              (spacing, coef) = findSizes(
                maxWidth,
                textStyle.fontSize!,
                preferredSpacing,
                preferredCoef,
              );
              if (calcOccupied(getWidth(fontSize, coef), spacing) > maxWidth) {
                if (widget.automaticResizeMode ==
                    AutomaticResizeMode.findSizeOrWrap) {
                  spacing = preferredSpacing;
                  coef = preferredCoef;
                  wrap = true;
                }
              }
            case AutomaticResizeMode.wrap:
              wrap = true;
            case AutomaticResizeMode.none:
              break;
          }
        }

        final cellWidth = getWidth(fontSize, coef);
        final cells = [
          for (var i = 0; i < length; i++)
            buildCell(getFocusNode(i), getController(i), cellWidth, fontSize),
          if (isAutomatic)
            Opacity(
              opacity: 0.5,
              child: buildCell(
                automaticFocusNode!,
                automaticController!,
                cellWidth,
                fontSize,
              ),
            ),
        ];

        final Widget content;

        if (wrap) {
          content = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: spacing,
            children: cells,
          );
        } else {
          content = Wrap(
            spacing: preferredSpacing,
            runSpacing: preferredSpacing,
            children: cells,
          );
        }

        return content;
      },
    );

    return content;
  }
}

@freezed
class NumericEditingValue with _$NumericEditingValue {
  const factory NumericEditingValue({
    /// Whether input is valid.
    ///
    /// Gaps in cells is about invalid input, example: [1] [empty] [2].
    /// In this case [number] will be null.
    required bool isValid,

    /// Length of a [number]. Will be zero, if [isValid] is true.
    required int length,

    /// Null if [isValid] is true or if there is not any input.
    BigInt? number,

    @Default(-1) int focusedDigit,
  }) = _NumericEditingValue;
}

class NumericEditingController extends ValueNotifier<NumericEditingValue> {
  NumericEditingController([BigInt? value])
    : super(
        NumericEditingValue(
          isValid: true,
          length: value?.toString().length ?? 0,
          number: value,
        ),
      );

  BigInt? get number => value.number;
  bool get isValid => value.isValid;
  int get length => value.length;
  int get focusedDigit => value.focusedDigit;

  set number(BigInt? newValue) => value = value.copyWith(number: newValue);
  set isValid(bool newValue) => value = value.copyWith(isValid: newValue);
  set length(int newValue) => value = value.copyWith(length: newValue);
  set focusedDigit(int newValue) =>
      value = value.copyWith(focusedDigit: newValue);
}
