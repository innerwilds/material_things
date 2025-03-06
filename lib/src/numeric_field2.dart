import 'package:flutter/material.dart';

class NumericField2 extends StatefulWidget {
  const NumericField2({super.key});

  @override
  State<NumericField2> createState() => _NumericField2State();
}

class _NumericField2State extends State<NumericField2> {
  TextEditingController controller = NumericField2EditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
    );
  }
}

class NumericField2EditingController extends TextEditingController {
  @override
  TextSpan buildTextSpan({required BuildContext context, required bool withComposing, TextStyle? style}) {
    // TODO: implement buildTextSpan
    return super.buildTextSpan(context: context, style: style, withComposing: withComposing);
  }
}