import 'package:flutter/material.dart';

import 'countries.dart';
import 'country_editing_controller.dart';

/// Shows currently selected country from [CountryEditingController] as a
/// [TextField] using [InputDecorator] and makes it tappable as a [InkWell].
class CountryButton extends StatefulWidget {
  const CountryButton({
    required this.onTap,
    super.key,
    this.country,
    this.controller,
    this.focusNode,
    this.decoration,
    this.additionalCountries,
  }) : assert(
         country == null || controller == null,
         'You can use either controller or country, not both',
       );

  final FocusNode? focusNode;

  /// Decoration around button.
  final InputDecoration? decoration;

  /// Country to show.
  final Country? country;

  /// Controller with country to show with listening.
  ///
  /// The country will be not set automatically via controller,
  /// because it is just a button.
  final CountryEditingController? controller;

  /// Additional countries to be show as flags.
  final List<Country>? additionalCountries;

  /// Will be called when user taps on text field (button).
  final void Function() onTap;

  @override
  State<CountryButton> createState() => _CountryButtonState();
}

class _CountryButtonState extends State<CountryButton> {
  Country? get _country =>
      widget.controller != null ? widget.controller!.country : widget.country;

  FocusNode? _localFocusNode;
  FocusNode get focusNode {
    if (widget.focusNode == null) {
      return _localFocusNode ??= FocusNode()..addListener(onFocus);
    }
    if (_localFocusNode != null) {
      _localFocusNode!.dispose();
      _localFocusNode = null;
    }
    return widget.focusNode!;
  }

  bool isHovering = false;

  void onFocus() {
    setState(() {});
  }

  void onMouseEnter(_) {
    setState(() {
      isHovering = true;
    });
  }

  void onMouseExit(_) {
    setState(() {
      isHovering = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final aCountries = widget.additionalCountries;

    Widget buildContent() => InputDecorator(
      isFocused: focusNode.hasFocus,
      isEmpty: _country == null,
      isHovering: isHovering,
      decoration: (widget.decoration ?? const InputDecoration()).copyWith(
        border: const OutlineInputBorder(),
        suffixIcon: Icon(Icons.arrow_forward_ios_rounded),
        prefixIcon: AnimatedSwitcher(
          duration: kThemeAnimationDuration,
          child: Stack(
            clipBehavior: Clip.none,
            key: ValueKey(_country?.emoji),
            fit: StackFit.passthrough,
            alignment: Alignment.center,
            children: [
              if (aCountries != null)
                for (var i = aCountries.length ~/ 2 - 1; i > -1; i--)
                  Positioned(
                    left: -(i + 1).toDouble() * 5,
                    top: -(i + 1).toDouble() * 5,
                    child: Text(
                      aCountries[i].emoji,
                      textAlign: TextAlign.center,
                    ),
                  ),
              if (aCountries != null)
                for (var i = aCountries.length - 1; i > -1; i--)
                  Positioned(
                    left: (i - aCountries.length ~/ 2 + 1).toDouble() * 5,
                    top: (i - aCountries.length ~/ 2 + 1).toDouble() * 5,
                    child: Text(
                      aCountries[i].emoji,
                      textAlign: TextAlign.center,
                    ),
                  ),
              Text(_country?.emoji ?? '🏴‍☠️', textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
      //                                 Maintains height to be always the same
      child: Text(_country?.fullName ?? ' '),
    );

    Widget content;

    if (widget.controller != null) {
      content = ValueListenableBuilder(
        valueListenable: widget.controller!,
        builder: (context, _, __) => buildContent(),
      );
    } else {
      content = buildContent();
    }

    return InkWell(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: onMouseEnter,
        onExit: onMouseExit,
        child: content,
      ),
    );
  }
}
