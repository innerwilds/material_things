import 'package:collection/collection.dart';
import 'package:dart_things/dart_things.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'countries.freezed.dart';

abstract final class AssetCountries {
  static Future<List<Country>> load([
    String packageName = 'material_things',
    String assetsFile = 'assets/countries.txt',
  ]) async {
    final raw = await rootBundle.loadString(
      'packages/$packageName/$assetsFile',
    );
    final countries =
        raw.split(newLineRegExp).map((line) {
            return Country.fromRow(line);
          }).toList()
          ..sort((a, b) => a.fullName.compareTo(b.fullName));
    return countries;
  }
}

@Freezed(toJson: false, equal: false, copyWith: false, fromJson: false)
class Country with _$Country {
  /// You need to provide upper cased [twoLetterCode].
  const factory Country(
    int phoneCountryCode,
    String twoLetterCode,
    String fullName, [
    String? format,
  ]) = _Country;
  const Country._();

  factory Country.fromRow(String row) {
    final [a, b, c, ...rest] = row.split(';');
    return Country(int.parse(a), b, c, rest.firstOrNull);
  }

  String get emoji => _countryCodeEmoji(twoLetterCode);

  String toRow() =>
      '$phoneCountryCode;$twoLetterCode;$fullName;${format ?? ''}';

  @override
  bool operator ==(Object other) {
    return other is Country && other.twoLetterCode == twoLetterCode;
  }

  @override
  int get hashCode => twoLetterCode.hashCode;
}

String _countryCodeEmoji(String cc) {
  final codePoints = cc.codeUnits.map((c) => c + 127397);
  return String.fromCharCodes(codePoints);
}
