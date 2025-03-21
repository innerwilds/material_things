import 'package:flutter/widgets.dart';
import 'package:material_things/src/locales/locale.dart';

import 'locales.dart';
import 'locale_editing_controller.dart';

/// A [RestorableProperty] that knows how to store and restore a
/// [TextEditingController].
///
/// The [TextEditingController] is accessible via the [value] getter. During
/// state restoration, the property will restore [TextEditingController.text] to
/// the value it had when the restoration data it is getting restored from was
/// collected.
class RestorableLocaleEditingController
    extends RestorableChangeNotifier<LocaleEditingController> {
  /// Creates a [RestorableLocaleEditingController].
  ///
  /// This constructor treats a null `text` argument as if it were the empty
  /// string.
  factory RestorableLocaleEditingController({ExtendedLocale? locale}) =>
      RestorableLocaleEditingController.fromValue(
        locale == null
            ? LocaleEditingValue.empty
            : LocaleEditingValue(locale: locale),
      );

  /// Creates a [RestorableLocaleEditingController] from an initial
  /// [LocaleEditingValue].
  ///
  /// This constructor treats a null `value` argument as if it were
  /// [LocaleEditingValue.empty].
  RestorableLocaleEditingController.fromValue(LocaleEditingValue value)
    : _initialValue = value;

  final LocaleEditingValue _initialValue;

  @override
  LocaleEditingController createDefaultValue() {
    return LocaleEditingController.fromValue(_initialValue);
  }

  @override
  LocaleEditingController fromPrimitives(Object? data) {
    return LocaleEditingController(
      locale: ExtendedLocale.fromRow(data! as String),
    );
  }

  @override
  Object? toPrimitives() {
    return value.locale?.toRow();
  }
}
