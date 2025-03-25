import 'package:flutter/material.dart';
import 'package:material_things/material_things.dart';
import 'package:material_things/src/internal/select_any_page.dart';
import 'package:material_things/src/locales/locale.dart';

/// Select locale page crafted using Material 3.
///
/// It will return peeked [ExtendedLocale] using Navigator.pop().
class SelectLocalePage extends StatelessWidget {
  const SelectLocalePage({
    required this.locales,
    required this.onPeek,
    this.canPop = true,
    super.key,
    this.searchController,
  });

  final void Function(ExtendedLocale) onPeek;

  /// [TextEditingController] to use within search field.
  final TextEditingController? searchController;

  /// List of all countries used by this page.
  ///
  /// To restrict countries from usage use [restrict].
  final List<ExtendedLocale> locales;

  final bool canPop;

  @override
  Widget build(BuildContext context) {
    final ls =
        MaterialThingsLocalizations.maybeOf(context) ??
        MaterialThingsLocalizations.builtInEn;

    final anyCountryHasCountryCode = locales.any((e) => e.countryCode != null);
    final noCountryWidget = switch(anyCountryHasCountryCode) {
      true => const SizedBox.shrink(),
      false => null,
    };

    return ScaffoldSelectAnyPage<ExtendedLocale>(
      onPeek: onPeek,
      canPop: canPop,
      pageTitle: Text(ls.chooseALocale),
      buildItem: (context, idx) {
        final locale = locales[idx];
        return SearchItem(
          title: Text(locale.nameLocal),
          leading:
              locale.countryCode != null ? Text(locale.countryEmoji!) : noCountryWidget,
          value: locale,
        );
      },
      itemsCount: locales.length,
      whereFitsSearchKeywords: (terms) {
        final lowered = terms.toLowerCase();
        return [
          for (final (idx, country) in locales.indexed)
            if (country.nameLocal.toLowerCase().startsWith(lowered)) idx,
        ];
      },
      useDivider: true,
      mayPlaceDivider: (idx, nextIdx) {
        final currentCountry = locales[idx];
        final nextCountry = nextIdx == null ? null : locales[nextIdx];

        if (nextCountry?.nameLocal.characters.toLowerCase().first !=
            currentCountry.nameLocal.characters.toLowerCase().first) {
          return true;
        }
        return false;
      },
    );
  }
}
