// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'locale_editing_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocaleEditingValue implements DiagnosticableTreeMixin {

 ExtendedLocale? get locale;
/// Create a copy of LocaleEditingValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocaleEditingValueCopyWith<LocaleEditingValue> get copyWith => _$LocaleEditingValueCopyWithImpl<LocaleEditingValue>(this as LocaleEditingValue, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LocaleEditingValue'))
    ..add(DiagnosticsProperty('locale', locale));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocaleEditingValue&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,locale);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LocaleEditingValue(locale: $locale)';
}


}

/// @nodoc
abstract mixin class $LocaleEditingValueCopyWith<$Res>  {
  factory $LocaleEditingValueCopyWith(LocaleEditingValue value, $Res Function(LocaleEditingValue) _then) = _$LocaleEditingValueCopyWithImpl;
@useResult
$Res call({
 ExtendedLocale? locale
});




}
/// @nodoc
class _$LocaleEditingValueCopyWithImpl<$Res>
    implements $LocaleEditingValueCopyWith<$Res> {
  _$LocaleEditingValueCopyWithImpl(this._self, this._then);

  final LocaleEditingValue _self;
  final $Res Function(LocaleEditingValue) _then;

/// Create a copy of LocaleEditingValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? locale = freezed,}) {
  return _then(_self.copyWith(
locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as ExtendedLocale?,
  ));
}

}


/// @nodoc


class _LocaleEditingValue extends LocaleEditingValue with DiagnosticableTreeMixin {
  const _LocaleEditingValue({this.locale}): super._();
  

@override final  ExtendedLocale? locale;

/// Create a copy of LocaleEditingValue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocaleEditingValueCopyWith<_LocaleEditingValue> get copyWith => __$LocaleEditingValueCopyWithImpl<_LocaleEditingValue>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LocaleEditingValue'))
    ..add(DiagnosticsProperty('locale', locale));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocaleEditingValue&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,locale);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LocaleEditingValue(locale: $locale)';
}


}

/// @nodoc
abstract mixin class _$LocaleEditingValueCopyWith<$Res> implements $LocaleEditingValueCopyWith<$Res> {
  factory _$LocaleEditingValueCopyWith(_LocaleEditingValue value, $Res Function(_LocaleEditingValue) _then) = __$LocaleEditingValueCopyWithImpl;
@override @useResult
$Res call({
 ExtendedLocale? locale
});




}
/// @nodoc
class __$LocaleEditingValueCopyWithImpl<$Res>
    implements _$LocaleEditingValueCopyWith<$Res> {
  __$LocaleEditingValueCopyWithImpl(this._self, this._then);

  final _LocaleEditingValue _self;
  final $Res Function(_LocaleEditingValue) _then;

/// Create a copy of LocaleEditingValue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? locale = freezed,}) {
  return _then(_LocaleEditingValue(
locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as ExtendedLocale?,
  ));
}


}

// dart format on
