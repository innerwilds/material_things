import 'dart:convert';
import 'dart:io';

import 'package:dart_things/dart_things.dart';

void main(List<String> arguments) {
  final outFile = arguments.elementAt(0);
  final inFile = File('${Directory.current.path}/data/countries.json');
  final countries = jsonDecode(inFile.readAsStringSync());
  final output = File('${Directory.current.path}/assets/$outFile.txt');

  print('Using $inFile to create table to write into $output.');

  final result = <String>[];

  for (final country in countries as List) {
    for (final language in [
      if (country['language'] != null) country['language'],
      ...?(country['languages'] as List?),
    ]) {
      final languageNameLocal = language['name_local'];
      final countryNameLocal = (country['country']['name_local'] as String).split('/').map(itselfTrim).toList().firstOrNull ?? '';

      result.add(
        [
          country['locale'],
          "$languageNameLocal${countryNameLocal.isBlankOrEmpty ? '' : ' ($countryNameLocal)'}",
        ].join(';'),
      );
    }
  }

  output.writeAsStringSync(result.join('\n'));
}
