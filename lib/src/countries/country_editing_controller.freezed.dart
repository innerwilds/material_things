// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_editing_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CountryEditingValue implements DiagnosticableTreeMixin {

 Country? get country;
/// Create a copy of CountryEditingValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountryEditingValueCopyWith<CountryEditingValue> get copyWith => _$CountryEditingValueCopyWithImpl<CountryEditingValue>(this as CountryEditingValue, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CountryEditingValue'))
    ..add(DiagnosticsProperty('country', country));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountryEditingValue&&(identical(other.country, country) || other.country == country));
}


@override
int get hashCode => Object.hash(runtimeType,country);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CountryEditingValue(country: $country)';
}


}

/// @nodoc
abstract mixin class $CountryEditingValueCopyWith<$Res>  {
  factory $CountryEditingValueCopyWith(CountryEditingValue value, $Res Function(CountryEditingValue) _then) = _$CountryEditingValueCopyWithImpl;
@useResult
$Res call({
 Country? country
});




}
/// @nodoc
class _$CountryEditingValueCopyWithImpl<$Res>
    implements $CountryEditingValueCopyWith<$Res> {
  _$CountryEditingValueCopyWithImpl(this._self, this._then);

  final CountryEditingValue _self;
  final $Res Function(CountryEditingValue) _then;

/// Create a copy of CountryEditingValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? country = freezed,}) {
  return _then(_self.copyWith(
country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as Country?,
  ));
}

}


/// @nodoc


class _CountryEditingValue extends CountryEditingValue with DiagnosticableTreeMixin {
  const _CountryEditingValue({this.country}): super._();
  

@override final  Country? country;

/// Create a copy of CountryEditingValue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountryEditingValueCopyWith<_CountryEditingValue> get copyWith => __$CountryEditingValueCopyWithImpl<_CountryEditingValue>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CountryEditingValue'))
    ..add(DiagnosticsProperty('country', country));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CountryEditingValue&&(identical(other.country, country) || other.country == country));
}


@override
int get hashCode => Object.hash(runtimeType,country);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CountryEditingValue(country: $country)';
}


}

/// @nodoc
abstract mixin class _$CountryEditingValueCopyWith<$Res> implements $CountryEditingValueCopyWith<$Res> {
  factory _$CountryEditingValueCopyWith(_CountryEditingValue value, $Res Function(_CountryEditingValue) _then) = __$CountryEditingValueCopyWithImpl;
@override @useResult
$Res call({
 Country? country
});




}
/// @nodoc
class __$CountryEditingValueCopyWithImpl<$Res>
    implements _$CountryEditingValueCopyWith<$Res> {
  __$CountryEditingValueCopyWithImpl(this._self, this._then);

  final _CountryEditingValue _self;
  final $Res Function(_CountryEditingValue) _then;

/// Create a copy of CountryEditingValue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? country = freezed,}) {
  return _then(_CountryEditingValue(
country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as Country?,
  ));
}


}

// dart format on
