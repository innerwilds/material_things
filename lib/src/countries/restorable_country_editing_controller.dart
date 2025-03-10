import 'package:flutter/widgets.dart';

import 'countries.dart';
import 'country_editing_controller.dart';

/// A [RestorableProperty] that knows how to store and restore a
/// [TextEditingController].
///
/// The [TextEditingController] is accessible via the [value] getter. During
/// state restoration, the property will restore [TextEditingController.text] to
/// the value it had when the restoration data it is getting restored from was
/// collected.
class RestorableCountryEditingController
    extends RestorableChangeNotifier<CountryEditingController> {
  /// Creates a [RestorableCountryEditingController].
  ///
  /// This constructor treats a null `text` argument as if it were the empty
  /// string.
  factory RestorableCountryEditingController({Country? country}) =>
      RestorableCountryEditingController.fromValue(
        country == null
            ? CountryEditingValue.empty
            : CountryEditingValue(country: country),
      );

  /// Creates a [RestorableCountryEditingController] from an initial
  /// [CountryEditingValue].
  ///
  /// This constructor treats a null `value` argument as if it were
  /// [CountryEditingValue.empty].
  RestorableCountryEditingController.fromValue(CountryEditingValue value)
    : _initialValue = value;

  final CountryEditingValue _initialValue;

  @override
  CountryEditingController createDefaultValue() {
    return CountryEditingController.fromValue(_initialValue);
  }

  @override
  CountryEditingController fromPrimitives(Object? data) {
    return CountryEditingController(country: Country.fromRow(data! as String));
  }

  @override
  Object? toPrimitives() {
    return value.country?.toRow();
  }
}
