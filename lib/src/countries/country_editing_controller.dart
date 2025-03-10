import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'countries.dart';

part 'country_editing_controller.freezed.dart';

@freezed
class CountryEditingValue with _$CountryEditingValue {
  const factory CountryEditingValue({Country? country}) = _CountryEditingValue;
  const CountryEditingValue._();

  static const empty = CountryEditingValue();
}

final class CountryEditingController
    extends ValueNotifier<CountryEditingValue> {
  CountryEditingController({Country? country})
    : super(CountryEditingValue(country: country));

  CountryEditingController.fromValue(super._value);

  Country? get country => value.country;
  set country(Country? country) =>
      value = CountryEditingValue(country: country);
}
