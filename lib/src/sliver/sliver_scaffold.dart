import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Scaffolds a Material 3 using [Scaffold] and uses [CustomScrollView]
/// as it's body.
///
/// So, this scaffold have same functionality as [Scaffold], except:
/// [AppBar] is replaced by [SliverAppBar].
/// [Scaffold.body] is always [CustomScrollView].
///
/// An [SliverAppBar] can be placed using [appBar].
class SliverScaffold extends StatelessWidget {
  const SliverScaffold({
    super.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
    this.scrollController,
    this.leading,
  }) : super();

  /// Scroll controller to pass to underlying [CustomScrollView].
  ///
  /// Takes precedence over [SliverScaffoldFeatures.scrollController].
  final ScrollController? scrollController;

  /// Leading sliver abo
  final Widget? leading;

  /// If true, and [bottomNavigationBar] or [persistentFooterButtons]
  /// is specified, then the [body] extends to the bottom of the Scaffold,
  /// instead of only extending to the top of the [bottomNavigationBar]
  /// or the [persistentFooterButtons].
  ///
  /// If true, a [MediaQuery] widget whose bottom padding matches the height
  /// of the [bottomNavigationBar] will be added above the scaffold's [body].
  ///
  /// This property is often useful when the [bottomNavigationBar] has
  /// a non-rectangular shape, like [CircularNotchedRectangle], which
  /// adds a [FloatingActionButton] sized notch to the top edge of the bar.
  /// In this case specifying `extendBody: true` ensures that scaffold's
  /// body will be visible through the bottom navigation bar's notch.
  ///
  /// See also:
  ///
  ///  * [extendBodyBehindAppBar], which extends the height of the body
  ///    to the top of the scaffold.
  final bool extendBody;

  /// If true, and an [appBar] is specified, then the height of the [body] is
  /// extended to include the height of the app bar and the top of the body
  /// is aligned with the top of the app bar.
  ///
  /// This is useful if the app bar's [AppBar.backgroundColor] is not
  /// completely opaque.
  ///
  /// This property is false by default.
  ///
  /// See also:
  ///
  ///  * [extendBody], which extends the height of the body to the bottom
  ///    of the scaffold.
  final bool extendBodyBehindAppBar;

  /// An app bar to display at the top of the scaffold.
  final Widget? appBar;

  /// The primary content of the scaffold.
  ///
  /// Displayed below the [appBar], above the bottom of the ambient
  /// [MediaQuery]'s [MediaQueryData.viewInsets], and behind the
  /// [floatingActionButton] and [drawer]. If [resizeToAvoidBottomInset] is
  /// false then the body is not resized when the onscreen keyboard appears,
  /// i.e. it is not inset by `viewInsets.bottom`.
  ///
  /// The widget in the body of the scaffold is positioned at the top-left of
  /// the available space between the app bar and the bottom of the scaffold. To
  /// center this widget instead, consider putting it in a [Center] widget and
  /// having that be the body. To expand this widget instead, consider
  /// putting it in a [SizedBox.expand].
  ///
  /// If you have a column of widgets that should normally fit on the screen,
  /// but may overflow and would in such cases need to scroll, consider using a
  /// [ListView] as the body of the scaffold. This is also a good choice for
  /// the case where your body is a scrollable list.
  final List<Widget>? body;

  /// A button displayed floating above [body], in the bottom right corner.
  ///
  /// Typically a [FloatingActionButton].
  final Widget? floatingActionButton;

  /// Responsible for determining where the [floatingActionButton] should go.
  ///
  /// If null, the [ScaffoldState] will use the default location, [FloatingActionButtonLocation.endFloat].
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Animator to move the [floatingActionButton] to a new [floatingActionButtonLocation].
  ///
  /// If null, the [ScaffoldState] will use the default animator, [FloatingActionButtonAnimator.scaling].
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  /// A set of buttons that are displayed at the bottom of the scaffold.
  ///
  /// Typically this is a list of [TextButton] widgets. These buttons are
  /// persistently visible, even if the [body] of the scaffold scrolls.
  ///
  /// These widgets will be wrapped in an [OverflowBar].
  ///
  /// The [persistentFooterButtons] are rendered above the
  /// [bottomNavigationBar] but below the [body].
  final List<Widget>? persistentFooterButtons;

  /// The alignment of the [persistentFooterButtons] inside the [OverflowBar].
  ///
  /// Defaults to [AlignmentDirectional.centerEnd].
  final AlignmentDirectional persistentFooterAlignment;

  /// A panel displayed to the side of the [body], often hidden on mobile
  /// devices. Swipes in from either left-to-right ([TextDirection.ltr]) or
  /// right-to-left ([TextDirection.rtl])
  ///
  /// Typically a [Drawer].
  ///
  /// To open the drawer, use the [ScaffoldState.openDrawer] function.
  ///
  /// To close the drawer, use either [ScaffoldState.closeDrawer], [Navigator.pop]
  /// or press the escape key on the keyboard.
  ///
  /// {@tool dartpad}
  /// To disable the drawer edge swipe on mobile, set the
  /// [Scaffold.drawerEnableOpenDragGesture] to false. Then, use
  /// [ScaffoldState.openDrawer] to open the drawer and [Navigator.pop] to close
  /// it.
  ///
  /// ** See code in examples/api/lib/material/scaffold/scaffold.drawer.0.dart **
  /// {@end-tool}
  final Widget? drawer;

  /// Optional callback that is called when the [Scaffold.drawer] is opened or closed.
  final DrawerCallback? onDrawerChanged;

  /// A panel displayed to the side of the [body], often hidden on mobile
  /// devices. Swipes in from right-to-left ([TextDirection.ltr]) or
  /// left-to-right ([TextDirection.rtl])
  ///
  /// Typically a [Drawer].
  ///
  /// To open the drawer, use the [ScaffoldState.openEndDrawer] function.
  ///
  /// To close the drawer, use either [ScaffoldState.closeEndDrawer], [Navigator.pop]
  /// or press the escape key on the keyboard.
  ///
  /// {@tool dartpad}
  /// To disable the drawer edge swipe, set the
  /// [Scaffold.endDrawerEnableOpenDragGesture] to false. Then, use
  /// [ScaffoldState.openEndDrawer] to open the drawer and [Navigator.pop] to
  /// close it.
  ///
  /// ** See code in examples/api/lib/material/scaffold/scaffold.end_drawer.0.dart **
  /// {@end-tool}
  final Widget? endDrawer;

  /// Optional callback that is called when the [Scaffold.endDrawer] is opened or closed.
  final DrawerCallback? onEndDrawerChanged;

  /// The color to use for the scrim that obscures primary content while a drawer is open.
  ///
  /// If this is null, then [DrawerThemeData.scrimColor] is used. If that
  /// is also null, then it defaults to [Colors.black54].
  final Color? drawerScrimColor;

  /// The color of the [Material] widget that underlies the entire Scaffold.
  ///
  /// The theme's [ThemeData.scaffoldBackgroundColor] by default.
  final Color? backgroundColor;

  /// A bottom navigation bar to display at the bottom of the scaffold.
  ///
  /// Snack bars slide from underneath the bottom navigation bar while bottom
  /// sheets are stacked on top.
  ///
  /// The [bottomNavigationBar] is rendered below the [persistentFooterButtons]
  /// and the [body].
  final Widget? bottomNavigationBar;

  /// The persistent bottom sheet to display.
  ///
  /// A persistent bottom sheet shows information that supplements the primary
  /// content of the app. A persistent bottom sheet remains visible even when
  /// the user interacts with other parts of the app.
  ///
  /// A closely related widget is a modal bottom sheet, which is an alternative
  /// to a menu or a dialog and prevents the user from interacting with the rest
  /// of the app. Modal bottom sheets can be created and displayed with the
  /// [showModalBottomSheet] function.
  ///
  /// Unlike the persistent bottom sheet displayed by [showBottomSheet]
  /// this bottom sheet is not a [LocalHistoryEntry] and cannot be dismissed
  /// with the scaffold appbar's back button.
  ///
  /// If a persistent bottom sheet created with [showBottomSheet] is already
  /// visible, it must be closed before building the Scaffold with a new
  /// [bottomSheet].
  ///
  /// The value of [bottomSheet] can be any widget at all. It's unlikely to
  /// actually be a [BottomSheet], which is used by the implementations of
  /// [showBottomSheet] and [showModalBottomSheet]. Typically it's a widget
  /// that includes [Material].
  ///
  /// See also:
  ///
  ///  * [showBottomSheet], which displays a bottom sheet as a route that can
  ///    be dismissed with the scaffold's back button.
  ///  * [showModalBottomSheet], which displays a modal bottom sheet.
  ///  * [BottomSheetThemeData], which can be used to customize the default
  ///    bottom sheet property values when using a [BottomSheet].
  final Widget? bottomSheet;

  /// If true the [body] and the scaffold's floating widgets should size
  /// themselves to avoid the onscreen keyboard whose height is defined by the
  /// ambient [MediaQuery]'s [MediaQueryData.viewInsets] `bottom` property.
  ///
  /// For example, if there is an onscreen keyboard displayed above the
  /// scaffold, the body can be resized to avoid overlapping the keyboard, which
  /// prevents widgets inside the body from being obscured by the keyboard.
  ///
  /// Defaults to true.
  final bool? resizeToAvoidBottomInset;

  /// Whether this scaffold is being displayed at the top of the screen.
  ///
  /// If true then the height of the [appBar] will be extended by the height
  /// of the screen's status bar, i.e. the top padding for [MediaQuery].
  ///
  /// The default value of this property, like the default value of
  /// [AppBar.primary], is true.
  final bool primary;

  /// {@macro flutter.material.DrawerController.dragStartBehavior}
  final DragStartBehavior drawerDragStartBehavior;

  /// The width of the area within which a horizontal swipe will open the
  /// drawer.
  ///
  /// By default, the value used is 20.0 added to the padding edge of
  /// `MediaQuery.paddingOf(context)` that corresponds to the surrounding
  /// [TextDirection]. This ensures that the drag area for notched devices is
  /// not obscured. For example, if `TextDirection.of(context)` is set to
  /// [TextDirection.ltr], 20.0 will be added to
  /// `MediaQuery.paddingOf(context).left`.
  final double? drawerEdgeDragWidth;

  /// Determines if the [Scaffold.drawer] can be opened with a drag
  /// gesture on mobile.
  ///
  /// On desktop platforms, the drawer is not draggable.
  ///
  /// By default, the drag gesture is enabled on mobile.
  final bool drawerEnableOpenDragGesture;

  /// Determines if the [Scaffold.endDrawer] can be opened with a
  /// gesture on mobile.
  ///
  /// On desktop platforms, the drawer is not draggable.
  ///
  /// By default, the drag gesture is enabled on mobile.
  final bool endDrawerEnableOpenDragGesture;

  /// Restoration ID to save and restore the state of the [Scaffold].
  ///
  /// If it is non-null, the scaffold will persist and restore whether the
  /// [drawer] and [endDrawer] was open or closed.
  ///
  /// The state of this widget is persisted in a [RestorationBucket] claimed
  /// from the surrounding [RestorationScope] using the provided restoration ID.
  ///
  /// See also:
  ///
  ///  * [RestorationManager], which explains how state restoration works in
  ///    Flutter.
  final String? restorationId;

  @override
  Widget build(BuildContext context) {
    final features = SliverScaffoldFeatures.maybeOf(context);
    final localScrollController = scrollController ?? features?.scrollController;
    final localLeading = leading ?? features?.leadingBuilder?.call(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      persistentFooterButtons: persistentFooterButtons,
      persistentFooterAlignment: persistentFooterAlignment,
      drawer: drawer,
      onDrawerChanged: onDrawerChanged,
      endDrawer: endDrawer,
      onEndDrawerChanged: onEndDrawerChanged,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      primary: primary,
      drawerDragStartBehavior: drawerDragStartBehavior,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      drawerScrimColor: drawerScrimColor,
      drawerEdgeDragWidth: drawerEdgeDragWidth,
      drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
      endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
      restorationId: restorationId,
      body: CustomScrollView(
        controller: localScrollController,
        slivers: [
          if (localLeading != null) localLeading,
          if (appBar != null) appBar!,
          ...?body,
        ],
      ),
    );
  }
}

/// Provides a transitive way to put something on underlying [SliverScaffold].
///
/// So, for example, when we use [SliverScaffold] inside [BottomSheet],
/// and we want to place some drag handle into a [SliverScaffold], but
/// the scaffold is deeply inside, hidden from some user class, we can use
/// [leadingBuilder] with [PinnedHeaderSliver].
class SliverScaffoldFeatures extends InheritedWidget {
  const SliverScaffoldFeatures({
    required Widget child,
    super.key,
    this.leadingBuilder,
    this.scrollController,
  }) : super(child: child);

  /// Leading sliver builder above all slivers (even [SliverScaffold.appBar]).
  final WidgetBuilder? leadingBuilder;

  /// Scroll controller to pass to all [SliverScaffold]s down to the tree.
  final ScrollController? scrollController;

  static ScrollController? scrollControllerOf(BuildContext context) {
    return maybeOf(context)?.scrollController;
  }

  static WidgetBuilder? leadingBuilderOf(BuildContext context) {
    return maybeOf(context)?.leadingBuilder;
  }

  static SliverScaffoldFeatures? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SliverScaffoldFeatures>();
  }

  @override
  bool updateShouldNotify(SliverScaffoldFeatures old) {
    return old.leadingBuilder != leadingBuilder;
  }
}
