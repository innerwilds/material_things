import 'package:collection/collection.dart';
import 'package:dart_things/dart_things.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'countries.freezed.dart';

final class AssetCountries extends Countries {
  @override
  final List<Country> countries;

  const AssetCountries._({required this.countries});

  static Future<Countries> load([String packageName = 'ui_things', String assetsFile = 'assets/countries.txt']) async {
    final raw = await rootBundle.loadString(
      'packages/$packageName/$assetsFile'
    );
    final countries = raw.split(newLineRegExp).map((line) {
      return Country.fromRow(line);
    }).toList();
    countries.sort((a, b) => a.fullName.compareTo(b.fullName));
    return AssetCountries._(countries: countries);
  }
}

final class HardcodedCountries extends Countries {
  HardcodedCountries._();

  factory HardcodedCountries() => _instance = HardcodedCountries._();

  static HardcodedCountries? _instance;

  @override
  final countries =  [
    Country(1876, 'JM', 'Jamaica', 'XXX XXXX'),
    Country(1869, 'KN', 'Saint Kitts & Nevis', 'XXX XXXX'),
    Country(1868, 'TT', 'Trinidad & Tobago', 'XXX XXXX'),
    Country(1784, 'VC', 'Saint Vincent & the Grenadines', 'XXX XXXX'),
    Country(1767, 'DM', 'Dominica', 'XXX XXXX'),
    Country(1758, 'LC', 'Saint Lucia', 'XXX XXXX'),
    Country(1721, 'SX', 'Sint Maarten', 'XXX XXXX'),
    Country(1684, 'AS', 'American Samoa', 'XXX XXXX'),
    Country(1671, 'GU', 'Guam', 'XXX XXXX'),
    Country(1670, 'MP', 'Northern Mariana Islands', 'XXX XXXX'),
    Country(1664, 'MS', 'Montserrat', 'XXX XXXX'),
    Country(1649, 'TC', 'Turks & Caicos Islands', 'XXX XXXX'),
    Country(1473, 'GD', 'Grenada', 'XXX XXXX'),
    Country(1441, 'BM', 'Bermuda', 'XXX XXXX'),
    Country(1345, 'KY', 'Cayman Islands', 'XXX XXXX'),
    Country(1340, 'VI', 'US Virgin Islands', 'XXX XXXX'),
    Country(1284, 'VG', 'British Virgin Islands', 'XXX XXXX'),
    Country(1268, 'AG', 'Antigua & Barbuda', 'XXX XXXX'),
    Country(1264, 'AI', 'Anguilla', 'XXX XXXX'),
    Country(1246, 'BB', 'Barbados', 'XXX XXXX'),
    Country(1242, 'BS', 'Bahamas', 'XXX XXXX'),
    Country(998, 'UZ', 'Uzbekistan', 'XX XXXXXXX'),
    Country(996, 'KG', 'Kyrgyzstan', 'XXX XXXXXX'),
    Country(995, 'GE', 'Georgia', 'XXX XXX XXX'),
    Country(994, 'AZ', 'Azerbaijan', 'XX XXX XXXX'),
    Country(993, 'TM', 'Turkmenistan', 'XX XXXXXX'),
    Country(992, 'TJ', 'Tajikistan', 'XX XXX XXXX'),
    Country(977, 'NP', 'Nepal', 'XX XXXX XXXX'),
    Country(976, 'MN', 'Mongolia', 'XX XX XXXX'),
    Country(975, 'BT', 'Bhutan', 'XX XXX XXX'),
    Country(974, 'QA', 'Qatar', 'XX XXX XXX'),
    Country(973, 'BH', 'Bahrain', 'XXXX XXXX'),
    Country(972, 'IL', 'Israel', 'XX XXX XXXX'),
    Country(971, 'AE', 'United Arab Emirates', 'XX XXX XXXX'),
    Country(970, 'PS', 'Palestine', 'XXX XX XXXX'),
    Country(968, 'OM', 'Oman', 'XXXX XXXX'),
    Country(967, 'YE', 'Yemen', 'XXX XXX XXX'),
    Country(966, 'SA', 'Saudi Arabia', 'XX XXX XXXX'),
    Country(965, 'KW', 'Kuwait', 'XXXX XXXX'),
    Country(964, 'IQ', 'Iraq', 'XXX XXX XXXX'),
    Country(963, 'SY', 'Syria', 'XXX XXX XXX'),
    Country(962, 'JO', 'Jordan', 'X XXXX XXXX'),
    Country(961, 'LB', 'Lebanon'),
    Country(960, 'MV', 'Maldives', 'XXX XXXX'),
    Country(888, 'FT', 'Anonymous Numbers', 'XXXX XXXX'),
    Country(886, 'TW', 'Taiwan', 'XXX XXX XXX'),
    Country(883, 'GO', 'International Networks'),
    Country(882, 'GO', 'International Networks'),
    Country(881, 'GO', 'Global Mobile Satellite'),
    Country(880, 'BD', 'Bangladesh'),
    Country(856, 'LA', 'Laos', 'XX XX XXX XXX'),
    Country(855, 'KH', 'Cambodia'),
    Country(853, 'MO', 'Macau', 'XXXX XXXX'),
    Country(852, 'HK', 'Hong Kong', 'X XXX XXXX'),
    Country(850, 'KP', 'North Korea'),
    Country(692, 'MH', 'Marshall Islands'),
    Country(691, 'FM', 'Micronesia'),
    Country(690, 'TK', 'Tokelau'),
    Country(689, 'PF', 'French Polynesia'),
    Country(688, 'TV', 'Tuvalu'),
    Country(687, 'NC', 'New Caledonia'),
    Country(686, 'KI', 'Kiribati'),
    Country(685, 'WS', 'Samoa'),
    Country(683, 'NU', 'Niue'),
    Country(682, 'CK', 'Cook Islands'),
    Country(681, 'WF', 'Wallis & Futuna'),
    Country(680, 'PW', 'Palau'),
    Country(679, 'FJ', 'Fiji'),
    Country(678, 'VU', 'Vanuatu'),
    Country(677, 'SB', 'Solomon Islands'),
    Country(676, 'TO', 'Tonga'),
    Country(675, 'PG', 'Papua New Guinea'),
    Country(674, 'NR', 'Nauru'),
    Country(673, 'BN', 'Brunei Darussalam', 'XXX XXXX'),
    Country(672, 'NF', 'Norfolk Island'),
    Country(670, 'TL', 'Timor-Leste'),
    Country(599, 'BQ', 'Bonaire, Sint Eustatius & Saba'),
    Country(599, 'CW', 'Curaçao'),
    Country(598, 'UY', 'Uruguay', 'X XXX XXXX'),
    Country(597, 'SR', 'Suriname', 'XXX XXXX'),
    Country(596, 'MQ', 'Martinique'),
    Country(595, 'PY', 'Paraguay', 'XXX XXX XXX'),
    Country(594, 'GF', 'French Guiana'),
    Country(593, 'EC', 'Ecuador', 'XX XXX XXXX'),
    Country(592, 'GY', 'Guyana'),
    Country(591, 'BO', 'Bolivia', 'X XXX XXXX'),
    Country(590, 'GP', 'Guadeloupe', 'XXX XX XX XX'),
    Country(509, 'HT', 'Haiti'),
    Country(508, 'PM', 'Saint Pierre & Miquelon'),
    Country(507, 'PA', 'Panama', 'XXXX XXXX'),
    Country(506, 'CR', 'Costa Rica', 'XXXX XXXX'),
    Country(505, 'NI', 'Nicaragua', 'XXXX XXXX'),
    Country(504, 'HN', 'Honduras', 'XXXX XXXX'),
    Country(503, 'SV', 'El Salvador', 'XXXX XXXX'),
    Country(502, 'GT', 'Guatemala', 'X XXX XXXX'),
    Country(501, 'BZ', 'Belize'),
    Country(500, 'FK', 'Falkland Islands'),
    Country(423, 'LI', 'Liechtenstein'),
    Country(421, 'SK', 'Slovakia', 'XXX XXX XXX'),
    Country(420, 'CZ', 'Czech Republic', 'XXX XXX XXX'),
    Country(389, 'MK', 'Macedonia', 'XX XXX XXX'),
    Country(387, 'BA', 'Bosnia & Herzegovina', 'XX XXX XXX'),
    Country(386, 'SI', 'Slovenia', 'XX XXX XXX'),
    Country(385, 'HR', 'Croatia'),
    Country(383, 'XK', 'Kosovo', 'XXXX XXXX'),
    Country(382, 'ME', 'Montenegro'),
    Country(381, 'RS', 'Serbia', 'XX XXX XXXX'),
    Country(380, 'UA', 'Ukraine', 'XX XXX XX XX'),
    Country(378, 'SM', 'San Marino', 'XXX XXX XXXX'),
    Country(377, 'MC', 'Monaco', 'XXXX XXXX'),
    Country(376, 'AD', 'Andorra', 'XX XX XX'),
    Country(375, 'BY', 'Belarus', 'XX XXX XXXX'),
    Country(374, 'AM', 'Armenia', 'XX XXX XXX'),
    Country(373, 'MD', 'Moldova', 'XX XXX XXX'),
    Country(372, 'EE', 'Estonia'),
    Country(371, 'LV', 'Latvia', 'XXX XXXXX'),
    Country(370, 'LT', 'Lithuania', 'XXX XXXXX'),
    Country(359, 'BG', 'Bulgaria'),
    Country(358, 'FI', 'Finland'),
    Country(357, 'CY', 'Cyprus', 'XXXX XXXX'),
    Country(356, 'MT', 'Malta', 'XX XX XX XX'),
    Country(355, 'AL', 'Albania', 'XX XXX XXXX'),
    Country(354, 'IS', 'Iceland', 'XXX XXXX'),
    Country(353, 'IE', 'Ireland', 'XX XXX XXXX'),
    Country(352, 'LU', 'Luxembourg'),
    Country(351, 'PT', 'Portugal', 'X XXXX XXXX'),
    Country(350, 'GI', 'Gibraltar', 'XXXX XXXX'),
    Country(299, 'GL', 'Greenland', 'XXX XXX'),
    Country(298, 'FO', 'Faroe Islands', 'XXX XXX'),
    Country(297, 'AW', 'Aruba', 'XXX XXXX'),
    Country(291, 'ER', 'Eritrea', 'X XXX XXX'),
    Country(290, 'SH', 'Saint Helena', 'XX XXX'),
    Country(269, 'KM', 'Comoros', 'XXX XXXX'),
    Country(268, 'SZ', 'Swaziland', 'XXXX XXXX'),
    Country(267, 'BW', 'Botswana', 'XX XXX XXX'),
    Country(266, 'LS', 'Lesotho', 'XX XXX XXX'),
    Country(265, 'MW', 'Malawi', '77 XXX XXXX'),
    Country(264, 'NA', 'Namibia', 'XX XXX XXXX'),
    Country(263, 'ZW', 'Zimbabwe', 'XX XXX XXXX'),
    Country(262, 'RE', 'Réunion', 'XXX XXX XXX'),
    Country(261, 'MG', 'Madagascar', 'XX XX XXX XX'),
    Country(260, 'ZM', 'Zambia', 'XX XXX XXXX'),
    Country(258, 'MZ', 'Mozambique', 'XX XXX XXXX'),
    Country(257, 'BI', 'Burundi', 'XX XX XXXX'),
    Country(256, 'UG', 'Uganda', 'XX XXX XXXX'),
    Country(255, 'TZ', 'Tanzania', 'XX XXX XXXX'),
    Country(254, 'KE', 'Kenya', 'XXX XXX XXX'),
    Country(253, 'DJ', 'Djibouti', 'XX XX XX XX'),
    Country(252, 'SO', 'Somalia', 'XX XXX XXX'),
    Country(251, 'ET', 'Ethiopia', 'XX XXX XXXX'),
    Country(250, 'RW', 'Rwanda', 'XXX XXX XXX'),
    Country(249, 'SD', 'Sudan', 'XX XXX XXXX'),
    Country(248, 'SC', 'Seychelles', 'X XX XX XX'),
    Country(247, 'SH', 'Saint Helena', 'XXXX'),
    Country(246, 'IO', 'Diego Garcia', 'XXX XXXX'),
    Country(245, 'GW', 'Guinea-Bissau', 'XXX XXXX'),
    Country(244, 'AO', 'Angola', 'XXX XXX XXX'),
    Country(243, 'CD', 'Congo (Dem. Rep.)', 'XX XXX XXXX'),
    Country(242, 'CG', 'Congo (Rep.)', 'XX XXX XXXX'),
    Country(241, 'GA', 'Gabon', 'X XX XX XX'),
    Country(240, 'GQ', 'Equatorial Guinea', 'XXX XXX XXX'),
    Country(239, 'ST', 'São Tomé & Príncipe', 'XX XXXXX'),
    Country(238, 'CV', 'Cape Verde', 'XXX XXXX'),
    Country(237, 'CM', 'Cameroon', 'XXXX XXXX'),
    Country(236, 'CF', 'Central African Rep.', 'XX XX XX XX'),
    Country(235, 'TD', 'Chad', 'XX XX XX XX'),
    Country(234, 'NG', 'Nigeria'),
    Country(233, 'GH', 'Ghana'),
    Country(232, 'SL', 'Sierra Leone', 'XX XXX XXX'),
    Country(231, 'LR', 'Liberia'),
    Country(230, 'MU', 'Mauritius'),
    Country(229, 'BJ', 'Benin', 'XX XXX XXX'),
    Country(228, 'TG', 'Togo', 'XX XXX XXX'),
    Country(227, 'NE', 'Niger', 'XX XX XX XX'),
    Country(226, 'BF', 'Burkina Faso', 'XX XX XX XX'),
    Country(225, 'CI', 'Côte d`Ivoire', 'XX XXX XXX'),
    Country(224, 'GN', 'Guinea', 'XXX XXX XXX'),
    Country(223, 'ML', 'Mali', 'XXXX XXXX'),
    Country(222, 'MR', 'Mauritania', 'XXXX XXXX'),
    Country(221, 'SN', 'Senegal', 'XX XXX XXXX'),
    Country(220, 'GM', 'Gambia', 'XXX XXXX'),
    Country(218, 'LY', 'Libya', 'XX XXX XXXX'),
    Country(216, 'TN', 'Tunisia', 'XX XXX XXX'),
    Country(213, 'DZ', 'Algeria', 'XXX XX XX XX'),
    Country(212, 'MA', 'Morocco', 'XX XXX XXXX'),
    Country(211, 'SS', 'South Sudan', 'XX XXX XXXX'),
    Country(98, 'IR', 'Iran', 'XXX XXX XXXX'),
    Country(95, 'MM', 'Myanmar'),
    Country(94, 'LK', 'Sri Lanka', 'XX XXX XXXX'),
    Country(93, 'AF', 'Afghanistan', 'XXX XXX XXX'),
    Country(92, 'PK', 'Pakistan', 'XXX XXX XXXX'),
    Country(91, 'IN', 'India', 'XXXXX XXXXX'),
    Country(90, 'TR', 'Turkey', 'XXX XXX XXXX'),
    Country(86, 'CN', 'China', 'XXX XXXX XXXX'),
    Country(84, 'VN', 'Vietnam'),
    Country(82, 'KR', 'South Korea'),
    Country(81, 'JP', 'Japan', 'XX XXXX XXXX'),
    Country(66, 'TH', 'Thailand', 'X XXXX XXXX'),
    Country(65, 'SG', 'Singapore', 'XXXX XXXX'),
    Country(64, 'NZ', 'New Zealand'),
    Country(63, 'PH', 'Philippines', 'XXX XXX XXXX'),
    Country(62, 'ID', 'Indonesia'),
    Country(61, 'AU', 'Australia', 'XXX XXX XXX'),
    Country(60, 'MY', 'Malaysia'),
    Country(58, 'VE', 'Venezuela', 'XXX XXX XXXX'),
    Country(57, 'CO', 'Colombia', 'XXX XXX XXXX'),
    Country(56, 'CL', 'Chile', 'X XXXX XXXX'),
    Country(55, 'BR', 'Brazil', 'XX XXXXX XXXX'),
    Country(54, 'AR', 'Argentina'),
    Country(53, 'CU', 'Cuba', 'XXXX XXXX'),
    Country(52, 'MX', 'Mexico'),
    Country(51, 'PE', 'Peru', 'XXX XXX XXX'),
    Country(49, 'DE', 'Germany'),
    Country(48, 'PL', 'Poland', 'XXX XXX XXX'),
    Country(47, 'NO', 'Norway', 'XXXX XXXX'),
    Country(46, 'SE', 'Sweden', 'XX XXX XXXX'),
    Country(45, 'DK', 'Denmark', 'XXXX XXXX'),
    Country(44, 'GB', 'United Kingdom', 'XXXX XXXXXX'),
    Country(43, 'AT', 'Austria'),
    Country(42, 'YL', 'Y-land'),
    Country(41, 'CH', 'Switzerland', 'XX XXX XXXX'),
    Country(40, 'RO', 'Romania', 'XXX XXX XXX'),
    Country(39, 'IT', 'Italy'),
    Country(36, 'HU', 'Hungary', 'XXX XXX XXX'),
    Country(34, 'ES', 'Spain', 'XXX XXX XXX'),
    Country(33, 'FR', 'France', 'X XX XX XX XX'),
    Country(32, 'BE', 'Belgium', 'XXX XX XX XX'),
    Country(31, 'NL', 'Netherlands', 'X XX XX XX XX'),
    Country(30, 'GR', 'Greece', 'XXX XXX XXXX'),
    Country(27, 'ZA', 'South Africa', 'XX XXX XXXX'),
    Country(20, 'EG', 'Egypt', 'XX XXXX XXXX'),
    Country(7, 'KZ', 'Kazakhstan', 'XXX XXX XX XX'),
    Country(7, 'RU', 'Russian Federation', 'XXX XXX XXXX'),
    Country(1, 'PR', 'Puerto Rico', 'XXX XXX XXXX'),
    Country(1, 'DO', 'Dominican Rep.', 'XXX XXX XXXX'),
    Country(1, 'CA', 'Canada', 'XXX XXX XXXX'),
    Country(1, 'US', 'USA', 'XXX XXX XXXX'),
  ].sorted((a, b) => a.fullName.compareTo(b.fullName));

  void dispose() {
    _instance = null;
  }
}

@Freezed(
  toJson: false,
  equal: false,
  copyWith: false,
  fromJson: false,
)
class Country with _$Country {
  const Country._();

  /// You need to provide upper cased [twoLetterCode].
  const factory Country(
    int phoneCountryCode,
    String twoLetterCode,
    String fullName,
    [String? format]) = _Country;

  factory Country.fromRow(String row) {
    final [a, b, c, ...rest] = row.split(';');
    return Country(int.parse(a), b, c, rest.firstOrNull);
  }

  String get emoji => _countryCodeEmoji(twoLetterCode);

  String toRow() => '$phoneCountryCode;$twoLetterCode;$fullName;${format ?? ''}';

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

abstract interface class Countries {
  const Countries();

  /// Alphabetically ordered country list.
  List<Country> get countries;

  Country? byPhoneCode(int phoneCode) => countries.firstWhereOrNull((c)
    => c.phoneCountryCode == phoneCode);

  Country? byTwoLetterCode(String iso) => countries.firstWhereOrNull((c) => c.twoLetterCode == iso);
}