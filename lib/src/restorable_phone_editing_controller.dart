import 'package:flutter/widgets.dart';

import 'countries/countries.dart';
import 'phone_field.dart';

/// A [RestorableProperty] that knows how to store and restore a
/// [TextEditingController].
///
/// The [TextEditingController] is accessible via the [value] getter. During
/// state restoration, the property will restore [TextEditingController.text] to
/// the value it had when the restoration data it is getting restored from was
/// collected.
class RestorablePhoneEditingController
    extends RestorableChangeNotifier<PhoneEditingController> {
  /// Creates a [RestorablePhoneEditingController].
  ///
  /// This constructor treats a null `text` argument as if it were the empty
  /// string.
  factory RestorablePhoneEditingController({
    Country? country,
    String nsn = '',
  }) => RestorablePhoneEditingController.fromValue(
    PhoneEditingValue(nsn: nsn, country: country),
  );

  /// Creates a [RestorablePhoneEditingController] from an initial
  /// [PhoneEditingValue].
  ///
  /// This constructor treats a null `value` argument as if it were
  /// [PhoneEditingValue.empty].
  RestorablePhoneEditingController.fromValue(PhoneEditingValue value)
    : _initialValue = value;

  final PhoneEditingValue _initialValue;

  @override
  PhoneEditingController createDefaultValue() {
    return PhoneEditingController.fromValue(_initialValue);
  }

  @override
  PhoneEditingController fromPrimitives(Object? data) {
    if (data == null) {
      return PhoneEditingController();
    }

    assert(data is List);

    final [String? countryRow, String? nsn] = data as List<String?>;
    final country = countryRow == null ? null : Country.fromRow(countryRow);

    return PhoneEditingController(country: country, nsn: nsn ?? '');
  }

  @override
  Object toPrimitives() {
    return [value.country?.toRow(), value.nsn];
  }
}
