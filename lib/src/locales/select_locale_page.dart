import 'package:flutter/material.dart';
import 'package:material_things/material_things.dart';
import 'package:material_things/src/internal/select_any_page.dart';
import 'package:material_things/src/locales/locale.dart';

/// Select locale page crafted using Material 3.
///
/// It will return peeked [ExtendedLocale] using Navigator.pop().
class SelectLocalePage extends StatefulWidget {
  const SelectLocalePage({
    required this.locales,
    super.key,
    this.searchController,
  });

  /// [TextEditingController] to use within search field.
  final TextEditingController? searchController;

  /// List of all countries used by this page.
  ///
  /// To restrict countries from usage use [restrict].
  final List<ExtendedLocale> locales;

  @override
  State<SelectLocalePage> createState() => _SelectLocalePageState();
}

class _SelectLocalePageState extends State<SelectLocalePage> {
  @override
  Widget build(BuildContext context) {
    final ls =
        MaterialThingsLocalizations.maybeOf(context) ??
        MaterialThingsLocalizations.builtInEn;
    return ScaffoldSelectAnyPage<ExtendedLocale>(
      pageTitle: Text(ls.chooseALocale),
      buildItem: (context, idx) {
        final locale = widget.locales[idx];
        return SearchItem(
          title: Text(locale.nameLocal),
          leading:
              locale.countryCode != null ? Text(locale.countryEmoji!) : null,
          value: locale,
        );
      },
      itemsCount: widget.locales.length,
      whereFitsSearchKeywords: (terms) {
        final lowered = terms.toLowerCase();
        return [
          for (final (idx, country) in widget.locales.indexed)
            if (country.nameLocal.toLowerCase().startsWith(lowered)) idx,
        ];
      },
      useDivider: true,
      mayPlaceDivider: (idx, nextIdx) {
        final currentCountry = widget.locales[idx];
        final nextCountry = nextIdx == null ? null : widget.locales[nextIdx];

        if (nextCountry?.nameLocal.characters.toLowerCase().first !=
            currentCountry.nameLocal.characters.toLowerCase().first) {
          return true;
        }
        return false;
      },
    );
  }
}
