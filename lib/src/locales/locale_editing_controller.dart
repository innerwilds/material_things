import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:material_things/src/locales/locale.dart';
import 'package:material_things/src/locales/locales.dart';

part 'locale_editing_controller.freezed.dart';

@freezed
abstract class LocaleEditingValue with _$LocaleEditingValue {
  const factory LocaleEditingValue({ExtendedLocale? locale}) = _LocaleEditingValue;
  const LocaleEditingValue._();

  static const empty = LocaleEditingValue();
}

final class LocaleEditingController
    extends ValueNotifier<LocaleEditingValue> {
  LocaleEditingController({ExtendedLocale? locale})
    : super(LocaleEditingValue(locale: locale));

  LocaleEditingController.fromValue(super._value);

  ExtendedLocale? get locale => value.locale;
  set locale(ExtendedLocale? locale) =>
      value = LocaleEditingValue(locale: locale);
}
