import 'package:flutter/widgets.dart';

/// Triggers (just notifies about trigger call) something.
class Trigger<T extends Object> extends ChangeNotifier {
  Trigger();

  T? _data;

  /// A data provided at moment of notifying.
  @protected
  T? get data => _data;

  void trigger([T? data]) {
    _data = data;
    notifyListeners();
  }
}

mixin TriggerHolderStatefulMixin<T extends Trigger> on StatefulWidget {
  T get trigger;
}

mixin TriggerListenerState<T extends TriggerHolderStatefulMixin> on State<T> {
  void onTrigger();

  @override
  void initState() {
    super.initState();
    widget.trigger.addListener(onTrigger);
  }

  @override
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.trigger != widget.trigger) {
      oldWidget.trigger.removeListener(onTrigger);
      widget.trigger.addListener(onTrigger);
    }
  }
}
