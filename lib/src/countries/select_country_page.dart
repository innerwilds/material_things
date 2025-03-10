import 'package:flutter/material.dart';
import 'package:material_things/material_things.dart';

enum RestrictMode {
  /// Disables tile with restricted country.
  /// User can see the country in the list, but can't choose it.
  disableChoose,

  /// Hides restricted country from the list.
  hide,
}

/// Creates a widget to use within [MaterialPageRoute].
class SelectCountryPage extends StatefulWidget {
  const SelectCountryPage({
    required this.countries,
    super.key,
    this.searchController,
    this.restrictedCountries,
    this.restrictedReasons,
    this.restrictMode = RestrictMode.disableChoose,
  });

  /// [TextEditingController] to use within search field.
  final TextEditingController? searchController;

  /// List of all countries used by this page.
  ///
  /// To restrict countries from usage use [restrict].
  final List<Country> countries;

  /// List of restricted countries.
  final List<Country>? restrictedCountries;

  /// A map of reasons for restricted countries.
  ///
  /// Country(ru) -> you are under sanctions.
  final Map<Country, String>? restrictedReasons;

  /// Restricted mode.
  final RestrictMode restrictMode;

  @override
  State<SelectCountryPage> createState() => _SelectCountryPageState();
}

class _SelectCountryPageState extends State<SelectCountryPage> {
  TextEditingController? _controller;
  TextEditingController get effectiveController =>
      widget.searchController ?? _controller!;

  bool _searchModeEnabled = false;

  late List<Country> _filteredCountries;

  List<Country> _filterCountriesByTerms() {
    if (effectiveController.text.isEmpty) {
      return widget.countries;
    }

    final term = effectiveController.text.trim().toLowerCase();

    return widget.countries.where((e) {
      return e.fullName.toLowerCase().startsWith(term);
    }).toList();
  }

  void _onTermsChanged() {
    setState(() {
      _filteredCountries = _filterCountriesByTerms();
    });
  }

  void _refreshController() {
    if (widget.searchController != null) {
      _controller?.removeListener(_onTermsChanged);
      _controller?.dispose();
      _controller = null;
    } else {
      assert(_controller == null);
      _controller = TextEditingController();
    }
    effectiveController.addListener(_onTermsChanged);
  }

  bool _isRestricted(Country c) {
    return widget.restrictedCountries?.contains(c) ?? false;
  }

  String? _restrictionReason(Country c) => widget.restrictedReasons?[c];

  void _onCountryTap(Country country) {
    Navigator.pop(context, country);
  }

  void _applyRestriction(List<Country> countries) {
    final restricted = widget.restrictedCountries;
    assert(restricted != null);
    final mode = widget.restrictMode;

    switch (mode) {
      case RestrictMode.hide:
        countries.removeWhere((c) => restricted!.contains(c));
      case RestrictMode.disableChoose:
        break;
    }
  }

  void _refreshFilteredCountries() {
    _filteredCountries = _filterCountriesByTerms();

    if (widget.restrictedCountries != null) {
      _applyRestriction(_filteredCountries);
    }
  }

  @override
  void initState() {
    super.initState();
    _refreshController();
    _refreshFilteredCountries();
  }

  @override
  void didUpdateWidget(covariant SelectCountryPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.searchController != widget.searchController) {
      _refreshController();
    }

    if (oldWidget.restrictMode != widget.restrictMode) {
      _refreshFilteredCountries();
    }

    if (oldWidget.restrictedCountries != widget.restrictedCountries) {
      _refreshFilteredCountries();
    }
  }

  @override
  void dispose() {
    effectiveController.removeListener(_onTermsChanged);

    _controller?.dispose();
    _controller = null;

    _filteredCountries = [];

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ls =
        MaterialThingsLocalizations.maybeOf(context) ??
        MaterialThingsLocalizations.builtInEn;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            if (_searchModeEnabled) {
              setState(() {
                _searchModeEnabled = false;
              });
            } else {
              Navigator.pop(context);
            }
          },
        ),
        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: 120),
          child:
              _searchModeEnabled
                  ? Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: ls.search,
                          ),
                        ),
                      ),
                      ListenableBuilder(
                        listenable: effectiveController,
                        builder: (context, child) {
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 120),
                            child:
                                effectiveController.text.isEmpty
                                    ? null
                                    : IconButton(
                                      visualDensity: VisualDensity.compact,
                                      onPressed: effectiveController.clear,
                                      icon: Icon(Icons.clear),
                                    ),
                          );
                        },
                      ),
                    ],
                  )
                  : Text(ls.chooseACountry),
        ),
        actions: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 120),
            child:
                _searchModeEnabled
                    ? null
                    : IconButton(
                      onPressed:
                          () => setState(() {
                            _searchModeEnabled = true;
                          }),
                      icon: Icon(Icons.search),
                    ),
          ),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 120),
        child: ListView.separated(
          itemCount: _filteredCountries.length,
          separatorBuilder: (context, index) {
            final currentCountry = _filteredCountries[index];
            final nextCountry =
                index + 1 < _filteredCountries.length
                    ? _filteredCountries[index + 1]
                    : null;

            if (nextCountry?.fullName.characters.first !=
                currentCountry.fullName.characters.first) {
              return Divider();
            }
            return SizedBox.shrink();
          },
          itemBuilder: (context, index) {
            final country = _filteredCountries[index];

            void onTapHandler() {
              _onCountryTap(country);
            }

            final void Function()? onTap;
            final String? subtitle;

            if (widget.restrictMode == RestrictMode.disableChoose &&
                _isRestricted(country)) {
              onTap = null;
              subtitle = _restrictionReason(country);
            } else {
              subtitle = null;
              onTap = onTapHandler;
            }

            return ListTile(
              onTap: onTap,
              enabled: onTap != null,
              leading: Text(country.emoji),
              title: Text(country.fullName),
              subtitle: subtitle != null ? Text(subtitle) : null,
            );
          },
        ),
      ),
    );
  }
}
