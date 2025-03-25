import 'package:flutter/material.dart';
import 'package:material_things/material_things.dart';
import 'package:material_things/src/internal/select_any_page.dart';

enum RestrictMode {
  /// Disables tile with restricted country.
  /// User can see the country in the list, but can't choose it.
  disableChoose,

  /// Hides restricted country from the list.
  hide,
}

/// Select country page crafted using Material 3.
///
/// It will return using Navigator.pop() a selected country.
class SelectCountryPage extends StatelessWidget {
  const SelectCountryPage({
    required this.countries,
    required this.onPeek,
    super.key,
    this.canPop = true,
    this.searchController,
    this.restrictedCountries,
    this.restrictMode = RestrictMode.disableChoose,
  });

  final void Function(Country) onPeek;

  /// [TextEditingController] to use within search field.
  final TextEditingController? searchController;

  /// List of all countries used by this page.
  ///
  /// To restrict countries from usage use [restrict].
  final List<Country> countries;

  /// A map of reasons for restricted countries.
  final Map<Country, String>? restrictedCountries;

  /// Restricted mode.
  final RestrictMode restrictMode;

  final bool canPop;

  @override
  Widget build(BuildContext context) {
    final ls =
        MaterialThingsLocalizations.maybeOf(context) ??
        MaterialThingsLocalizations.builtInEn;
    return ScaffoldSelectAnyPage<Country>(
      onPeek: onPeek,
      canPop: canPop,
      pageTitle: Text(ls.chooseACountry),
      buildItem: (context, idx) {
        final country = countries[idx];
        return SearchItem(
          title: Text(country.fullName),
          leading: Text(country.emoji),
          value: country,
          restrictionReason: restrictedCountries?[country],
        );
      },
      itemsCount: countries.length,
      whereFitsSearchKeywords: (terms) {
        final lowered = terms.toLowerCase();
        return [
          for (final (idx, country) in countries.indexed)
            if (country.fullName.toLowerCase().startsWith(lowered)) idx,
        ];
      },
      useDivider: true,
      mayPlaceDivider: (idx, nextIdx) {
        final currentCountry = countries[idx];
        final nextCountry = nextIdx == null ? null : countries[nextIdx];

        if (nextCountry?.fullName.characters.toLowerCase().first !=
            currentCountry.fullName.characters.toLowerCase().first) {
          return true;
        }
        return false;
      },
    );
  }
}
