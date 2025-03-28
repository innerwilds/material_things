import 'package:dart_things/coliseum.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:material_things/material_things.dart';

part 'select_any_page.freezed.dart';

/// Restrict mode for restricted items.
enum RestrictMode {
  /// Disables interaction with an item.
  nonInteractive,

  /// Hides an item.
  hide,
}

@freezed
abstract class SearchItem<T> with _$SearchItem<T> {
  const factory SearchItem({
    Widget? leading,
    required Widget title,
    required T value,

    /// Whether an [value] is restricted from peeking.
    ///
    /// Null means there is not restriction, an non-empty string means there
    /// is a restriction, and this string will be displayed.
    ///
    /// If [restrictMode] is [RestrictMode.hide], then you can use empty
    /// string, because reason will not be displayed.
    ///
    /// In case of [RestrictMode.hide] it will be better to just filter out an
    /// item externally.
    ///
    /// Builder will throw [AssertionError] in debug, if this field provides
    /// an empty or blank string when [restrictMode] is
    /// [RestrictMode.nonInteractive].
    String? restrictionReason,
  }) = _SearchItem<T>;
}

/// Select country page crafted using Material 3.
///
/// It will return using Navigator.pop() a selected country.
class ScaffoldSelectAnyPage<T> extends StatefulWidget {
  const ScaffoldSelectAnyPage({
    required this.buildItem,
    required this.itemsCount,
    required this.whereFitsSearchKeywords,
    required this.pageTitle,
    required this.onPeek,
    super.key,
    this.useDivider = false,
    this.mayPlaceDivider,
    this.restorationId,
    this.searchController,
    this.restrictMode = RestrictMode.nonInteractive,
    this.canPop = true,
  }) : assert(
         useDivider == false || mayPlaceDivider != null,
         'useDivider is true, so mayPlaceDivider must be provided',
       );

  final bool canPop;

  final void Function(T) onPeek;

  final String? restorationId;

  final Widget pageTitle;

  final bool useDivider;

  final bool Function(int current, int? next)? mayPlaceDivider;

  /// Filters items by keywords.
  ///
  /// Must return Set of indexes which items fits keywords,
  /// so a length of resulting set will be used instead of [itemsCount].
  final List<int> Function(String keywords) whereFitsSearchKeywords;

  final SearchItem<T> Function(BuildContext, int idx) buildItem;

  final int itemsCount;

  /// [TextEditingController] to use within search field.
  final TextEditingController? searchController;

  /// Restricted mode.
  final RestrictMode restrictMode;

  @override
  State<ScaffoldSelectAnyPage<T>> createState() =>
      _ScaffoldSelectAnyPageState<T>();
}

class _ScaffoldSelectAnyPageState<T> extends State<ScaffoldSelectAnyPage<T>> {
  final searchVisibilityController = ValueNotifier(false);

  List<int>? _filteredCountries;

  int get _itemsCount => _filteredCountries?.length ?? widget.itemsCount;
  int _itemIdx(int listItemIdx) =>
      _filteredCountries?[listItemIdx] ?? listItemIdx;

  List<int>? _filterCountriesByTerms(String terms) {
    if (terms.isBlankOrEmpty) {
      return null;
    }

    return widget.whereFitsSearchKeywords(terms.trim());
  }

  void _handleExplicitSearchControllerChange() {
    final terms = widget.searchController!.text;
    setState(() {
      _filteredCountries = _filterCountriesByTerms(terms);
    });
  }

  void _handleInternalSearchFieldChange(String terms) {
    setState(() {
      _filteredCountries = _filterCountriesByTerms(terms);
    });
  }

  void _handleTap(T something) {
    widget.onPeek(something);
  }

  @override
  void initState() {
    super.initState();
    widget.searchController?.addListener(_handleExplicitSearchControllerChange);
  }

  @override
  void didUpdateWidget(covariant ScaffoldSelectAnyPage<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.searchController != oldWidget.searchController) {
      oldWidget.searchController?.removeListener(
        _handleExplicitSearchControllerChange,
      );
      widget.searchController?.addListener(
        _handleExplicitSearchControllerChange,
      );
    }
  }

  @override
  void dispose() {
    widget.searchController?.removeListener(
      _handleExplicitSearchControllerChange,
    );
    _filteredCountries = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemsCount = _itemsCount;

    return SliverScaffold(
      appBar: _SearchAppBar(
        searchVisibilityController: searchVisibilityController,
        onSearchChange: _handleInternalSearchFieldChange,
        searchController: widget.searchController,
        title: widget.pageTitle,
      ),
      body: [
        SliverList.separated(
          itemCount: itemsCount,
          separatorBuilder: (context, idx) {
            final currentIdx = _itemIdx(idx);
            final nextIdx = idx + 1 < itemsCount ? _itemIdx(idx + 1) : null;

            if (widget.mayPlaceDivider?.call(currentIdx, nextIdx) ?? false) {
              return const Divider();
            }

            return const SizedBox.shrink();
          },
          itemBuilder: (context, falseIndex) {
            final idx = _itemIdx(falseIndex);
            final item = widget.buildItem(context, idx);

            void handleTap() {
              this._handleTap(item.value);
            }

            final void Function()? onTap;
            final String? subtitle;

            if (widget.restrictMode == RestrictMode.nonInteractive &&
                item.restrictionReason != null) {
              assert(
                item.restrictionReason!.isNotBlankOrEmpty,
                'Restriction reason was blank or empty when restrictMode is '
                'nonInteractive',
              );
              onTap = null;
              subtitle = item.restrictionReason;
            } else {
              subtitle = null;
              onTap = handleTap;
            }

            return ListTile(
              onTap: onTap,
              enabled: onTap != null,
              leading: item.leading,
              title: item.title,
              subtitle: subtitle != null ? Text(subtitle) : null,
            );
          },
        ),
      ],
    );
  }
}

class _SearchAppBar extends StatefulWidget {
  const _SearchAppBar({
    super.key,
    required this.searchVisibilityController,
    this.searchController,
    required this.onSearchChange,
    required this.title,
  });

  final Widget title;
  final TextEditingController? searchController;
  final ValueNotifier<bool> searchVisibilityController;
  final void Function(String) onSearchChange;

  @override
  State<_SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<_SearchAppBar> {
  void showSearch() {
    widget.searchVisibilityController.value = true;
  }

  void closeSearch() {
    widget.searchVisibilityController.value = false;
  }

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();
    return ValueListenableBuilder(
      valueListenable: widget.searchVisibilityController,
      builder: (context, visible, _) {
        final showBackButton = canPop || visible;
        final ls =
            MaterialThingsLocalizations.maybeOf(context) ??
            MaterialThingsLocalizations.builtInEn;

        final Widget? flexibleSpaceBar;

        final Widget? searchField;

        if (visible) {
          searchField = ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 300,
            ),
            child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          controller: widget.searchController,
                          autofocus: true,
                          onChanged:
                              widget.searchController == null
                                  ? widget.onSearchChange
                                  : null,
                          decoration: InputDecoration(
                            border: switch(defaultTargetPlatform) {
                              TargetPlatform.android ||
                              TargetPlatform.fuchsia ||
                              TargetPlatform.iOS => const UnderlineInputBorder(),
                              TargetPlatform.linux ||
                              TargetPlatform.macOS ||
                              TargetPlatform.windows => InputBorder.none,
                            },
                            hintText: ls.search,
                          ),
                        ),
                      ),
                      if (widget.searchController != null)
                        ListenableBuilder(
                          listenable: widget.searchController!,
                          builder: (context, child) {
                            return AnimatedSwitcher(
                              duration: const Duration(milliseconds: 120),
                              child:
                                  widget.searchController!.text.isEmpty
                                      ? null
                                      : IconButton(
                                        visualDensity: VisualDensity.compact,
                                        onPressed: widget.searchController!.clear,
                                        icon: const Icon(Icons.clear),
                                      ),
                            );
                          },
                        ),
                    ],
                  ),
          );
        } else {
          searchField = null;
        }

        if (visible) {
          flexibleSpaceBar = switch (defaultTargetPlatform) {
            TargetPlatform.android ||
            TargetPlatform.fuchsia ||
            TargetPlatform
                .iOS => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FlexibleSpaceBar(centerTitle: true, title: searchField),
                ),
            TargetPlatform.linux => null,
            TargetPlatform.macOS => null,
            TargetPlatform.windows => null,
          };
        } else {
          flexibleSpaceBar = FlexibleSpaceBar(
            centerTitle: true,
            title: widget.title,
          );
        }

        return SliverAppBar(
          automaticallyImplyLeading: false,
          leading:
              showBackButton
                  ? BackButton(
                    onPressed: () {
                      if (visible) {
                        closeSearch();
                      } else if (canPop) {
                        Navigator.pop(context);
                      }
                    },
                  )
                  : null,
          expandedHeight: switch (defaultTargetPlatform) {
            TargetPlatform.android ||
            TargetPlatform.fuchsia ||
            TargetPlatform.iOS => MediaQuery.sizeOf(context).height / 4,
            TargetPlatform.linux => null,
            TargetPlatform.macOS => null,
            TargetPlatform.windows => null,
          },
          pinned: true,
          flexibleSpace: flexibleSpaceBar,
          title: flexibleSpaceBar == null ? searchField : null,
          actions: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 120),
              child:
                  visible
                      ? null
                      : IconButton(
                        onPressed: showSearch,
                        icon: const Icon(Icons.search),
                      ),
            ),
          ],
        );
      },
    );
  }
}
