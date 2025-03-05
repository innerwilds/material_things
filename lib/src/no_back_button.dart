import 'package:flutter/widgets.dart';

class NoBackButton extends InheritedWidget {
  const NoBackButton({required super.child, super.key});

  static bool isThereNoBackButton(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NoBackButton>() != null;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
