import 'package:dart_things/dart_things.dart';
import 'package:flutter/cupertino.dart';
import 'package:material_things/material_things.dart';

const _underscore = '_';
const _dash = '-';

class ExtendedLocale extends Locale {
  const ExtendedLocale({
    required String languageCode,
    required this.nameLocal,
    String? countryCode,
    String? scriptCode,
  }) : super.fromSubtags(
         languageCode: languageCode,
         countryCode: countryCode,
         scriptCode: scriptCode,
       );

  factory ExtendedLocale.fromRow(String row) {
    final [locale, localeNameLocal] = row.split(';');
    return ExtendedLocale.fromString(locale, nameLocal: localeNameLocal);
  }

  factory ExtendedLocale.fromString(
    String localeString, {
    required String nameLocal,
  }) {
    if (localeString.trim().isEmpty) {
      throw ArgumentError('localeString was empty or blank.');
    }

    final len = localeString.length;

    if (len < 2) {
      throw ArgumentError('localeString was invalid: $localeString');
    }

    final firstCharacter = localeString.characters.elementAt(0);

    if (firstCharacter == _underscore || firstCharacter == _dash) {
      throw ArgumentError(
        'Language code is omitted from a locale string: $localeString',
      );
    }

    return _parseLocale(localeString, nameLocal: nameLocal);
  }

  static ExtendedLocale _parseLocale(
    String localeString, {
    required String nameLocal,
  }) {
    if (_isISO639LanguageCode(localeString)) {
      return ExtendedLocale(nameLocal: nameLocal, languageCode: localeString);
    }
    const limit = 3;
    final separator = localeString.contains(_underscore) ? _underscore : _dash;
    final segments = localeString.split(separator);
    final language = segments[0];
    if (segments.length == 2) {
      final country = segments[1];
      if (_isISO639LanguageCode(language) && _isISO3166CountryCode(country) ||
          _isNumericAreaCode(country)) {
        return ExtendedLocale(
          nameLocal: nameLocal,
          languageCode: language,
          countryCode: country,
        );
      }
    } else if (segments.length == limit) {
      final country = segments[1];
      final variant = segments[2];
      if (_isISO639LanguageCode(language) &&
          (country.isEmpty ||
              _isISO3166CountryCode(country) ||
              _isNumericAreaCode(country)) &&
          variant.isNotEmpty) {
        return ExtendedLocale(
          nameLocal: nameLocal,
          languageCode: language,
          countryCode: country,
          scriptCode: variant,
        );
      }
    }
    throw ArgumentError('localeString was invalid: $localeString');
  }

  /// TestsNo whether the given String is a UN M.49 numeric area code.
  ///
  /// @param str the String to check
  /// @return true, is the given String is a UN M.49 numeric area code.
  static bool _isNumericAreaCode(String str) {
    return str.isOnlyDigits && str.length == 3;
  }

  /// Tests whether the given String is a ISO 639 compliant language code.
  ///
  /// @param str the String to check.
  /// @return true, if the given String is a ISO 639 compliant language code.
  static bool _isISO639LanguageCode(String str) {
    return str.isLowerCase && (str.length == 2 || str.length == 3);
  }

  /// Tests whether the given String is a ISO 3166 alpha-2 country code.
  ///
  /// @param str the String to check
  /// @return true, is the given String is a ISO 3166 compliant country code.
  static bool _isISO3166CountryCode(String str) {
    return str.isUpperCase && str.length == 2;
  }

  final String nameLocal;

  String? get countryEmoji {
    if (countryCode == null) return null;
    return countryCodeToEmoji(countryCode!);
  }

  String toRow() {
    return '${toString()};$nameLocal';
  }

  ExtendedLocale copyWith({
    String? nameLocal,
    String? languageCode,
    String? countryCode,
    String? scriptCode,
  }) => ExtendedLocale(
    nameLocal: nameLocal ?? this.nameLocal,
    languageCode: languageCode ?? this.languageCode,
    countryCode: countryCode ?? this.countryCode,
    scriptCode: scriptCode ?? this.scriptCode,
  );
}
