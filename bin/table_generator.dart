import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dart_things/dart_things.dart';
import 'package:characters/characters.dart';

void main(List<String> arguments) {
  final outFile = arguments.elementAt(0);
  final inFile = File('${Directory.current.path}/data/countries.json');
  final locales = jsonDecode(inFile.readAsStringSync());
  final output = File('${Directory.current.path}/assets/$outFile.txt');

  print('Using $inFile to create table to write into $output.');

  final result = <String, String>{};

  for (final locale in locales as List) {
    final language = locale['language'] as Map;
    final languageCode =
        (language['iso_639_1'] as String).notBlankOrNull ??
        (language['iso_639_2'] as String).notBlankOrNull ??
        (language['iso_639_3'] as String).notBlankOrNull ??
        (throw UnsupportedError('No language code in locale: $locale'));
    final countries = language['countries'] as List;
    var languageNameLocal = (language['name_local']) as String;

    languageNameLocal =
        '${languageNameLocal.characters.first.toUpperCase()}${languageNameLocal.characters.skip(1)}';

    /// Language code only rows.
    result[languageCode] = languageNameLocal;

    /// Language code + country code rows
    for (final country in countries) {
      var specificName =
          (country['name_local'] as String?)?.notBlankOrNull ??
          (country['name'] as String?)?.notBlankOrNull;
      final countryCode = country['code'];

      if (specificName == languageNameLocal) {
        specificName = null;
      }

      if (specificName?.contains('/') ?? false) {
        specificName = specificName!.split('/').map(itselfTrim).firstOrNull;
      }

      result['${languageCode}_$countryCode'] =
          '$languageNameLocal${specificName == null ? '' : " ($specificName)"}';
    }
  }

  output.writeAsStringSync(
    result.entries
        .sorted((a, b) {
          return a.key.compareTo(b.key);
        })
        .sorted((a, b) {
          if (a.key.length > b.key.length) {
            return 1;
          } else if (a.key.length == b.key.length) {
            return 0;
          }
          return -1;
        })
        .map((e) {
          return '${e.key};${e.value}';
        })
        .join('\n'),
  );
}
