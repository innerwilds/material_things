// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_any_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchItem<T> implements DiagnosticableTreeMixin {

 Widget? get leading; Widget get title; T get value;/// Whether an [value] is restricted from peeking.
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
 String? get restrictionReason;
/// Create a copy of SearchItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchItemCopyWith<T, SearchItem<T>> get copyWith => _$SearchItemCopyWithImpl<T, SearchItem<T>>(this as SearchItem<T>, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SearchItem<$T>'))
    ..add(DiagnosticsProperty('leading', leading))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('value', value))..add(DiagnosticsProperty('restrictionReason', restrictionReason));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchItem<T>&&(identical(other.leading, leading) || other.leading == leading)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.value, value)&&(identical(other.restrictionReason, restrictionReason) || other.restrictionReason == restrictionReason));
}


@override
int get hashCode => Object.hash(runtimeType,leading,title,const DeepCollectionEquality().hash(value),restrictionReason);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SearchItem<$T>(leading: $leading, title: $title, value: $value, restrictionReason: $restrictionReason)';
}


}

/// @nodoc
abstract mixin class $SearchItemCopyWith<T,$Res>  {
  factory $SearchItemCopyWith(SearchItem<T> value, $Res Function(SearchItem<T>) _then) = _$SearchItemCopyWithImpl;
@useResult
$Res call({
 Widget? leading, Widget title, T value, String? restrictionReason
});




}
/// @nodoc
class _$SearchItemCopyWithImpl<T,$Res>
    implements $SearchItemCopyWith<T, $Res> {
  _$SearchItemCopyWithImpl(this._self, this._then);

  final SearchItem<T> _self;
  final $Res Function(SearchItem<T>) _then;

/// Create a copy of SearchItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? leading = freezed,Object? title = null,Object? value = freezed,Object? restrictionReason = freezed,}) {
  return _then(_self.copyWith(
leading: freezed == leading ? _self.leading : leading // ignore: cast_nullable_to_non_nullable
as Widget?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Widget,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as T,restrictionReason: freezed == restrictionReason ? _self.restrictionReason : restrictionReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _SearchItem<T> with DiagnosticableTreeMixin implements SearchItem<T> {
  const _SearchItem({this.leading, required this.title, required this.value, this.restrictionReason});
  

@override final  Widget? leading;
@override final  Widget title;
@override final  T value;
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
@override final  String? restrictionReason;

/// Create a copy of SearchItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchItemCopyWith<T, _SearchItem<T>> get copyWith => __$SearchItemCopyWithImpl<T, _SearchItem<T>>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SearchItem<$T>'))
    ..add(DiagnosticsProperty('leading', leading))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('value', value))..add(DiagnosticsProperty('restrictionReason', restrictionReason));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchItem<T>&&(identical(other.leading, leading) || other.leading == leading)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.value, value)&&(identical(other.restrictionReason, restrictionReason) || other.restrictionReason == restrictionReason));
}


@override
int get hashCode => Object.hash(runtimeType,leading,title,const DeepCollectionEquality().hash(value),restrictionReason);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SearchItem<$T>(leading: $leading, title: $title, value: $value, restrictionReason: $restrictionReason)';
}


}

/// @nodoc
abstract mixin class _$SearchItemCopyWith<T,$Res> implements $SearchItemCopyWith<T, $Res> {
  factory _$SearchItemCopyWith(_SearchItem<T> value, $Res Function(_SearchItem<T>) _then) = __$SearchItemCopyWithImpl;
@override @useResult
$Res call({
 Widget? leading, Widget title, T value, String? restrictionReason
});




}
/// @nodoc
class __$SearchItemCopyWithImpl<T,$Res>
    implements _$SearchItemCopyWith<T, $Res> {
  __$SearchItemCopyWithImpl(this._self, this._then);

  final _SearchItem<T> _self;
  final $Res Function(_SearchItem<T>) _then;

/// Create a copy of SearchItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? leading = freezed,Object? title = null,Object? value = freezed,Object? restrictionReason = freezed,}) {
  return _then(_SearchItem<T>(
leading: freezed == leading ? _self.leading : leading // ignore: cast_nullable_to_non_nullable
as Widget?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Widget,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as T,restrictionReason: freezed == restrictionReason ? _self.restrictionReason : restrictionReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
