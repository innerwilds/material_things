import 'package:collection/collection.dart';
import 'package:dart_things/dart_things.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:material_things/src/locales/locale.dart';

abstract final class AssetLocales {
  static Future<List<ExtendedLocale>> load([
    String packageName = 'material_things',
    String assetsFile = 'assets/locales.txt',
  ]) async {
    final raw = await rootBundle.loadString(
      'packages/$packageName/$assetsFile',
    );
    final countries =
        raw.split(newLineRegExp).map((line) {
            return ExtendedLocale.fromRow(line);
          }).toList()
          ..sort((a, b) => a.nameLocal.compareTo(b.nameLocal));
    return countries;
  }
}