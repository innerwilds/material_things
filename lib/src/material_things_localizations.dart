import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class MaterialThingsLocalizations {
  const MaterialThingsLocalizations();

  static const builtInEn = _MaterialThingsLocalizationsEn();

  /// Will be in select_country_page in title, before search field will be
  /// available.
  String get chooseACountry;

  /// Hint text for a search field in select_country_page.
  String get search;

  static MaterialThingsLocalizations of(BuildContext context) {
    return Localizations.of<MaterialThingsLocalizations>(
      context,
      MaterialThingsLocalizations,
    )!;
  }

  static MaterialThingsLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<MaterialThingsLocalizations>(
      context,
      MaterialThingsLocalizations,
    );
  }
}

final class _MaterialThingsLocalizationsEn
    implements MaterialThingsLocalizations {
  const _MaterialThingsLocalizationsEn();

  @override
  String get chooseACountry => 'Choose a country';

  @override
  String get search => 'Search';
}
