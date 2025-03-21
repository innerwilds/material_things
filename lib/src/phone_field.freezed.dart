// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PhoneEditingValue {

 Country? get country; String get nsn;
/// Create a copy of PhoneEditingValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhoneEditingValueCopyWith<PhoneEditingValue> get copyWith => _$PhoneEditingValueCopyWithImpl<PhoneEditingValue>(this as PhoneEditingValue, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneEditingValue&&(identical(other.country, country) || other.country == country)&&(identical(other.nsn, nsn) || other.nsn == nsn));
}


@override
int get hashCode => Object.hash(runtimeType,country,nsn);

@override
String toString() {
  return 'PhoneEditingValue(country: $country, nsn: $nsn)';
}


}

/// @nodoc
abstract mixin class $PhoneEditingValueCopyWith<$Res>  {
  factory $PhoneEditingValueCopyWith(PhoneEditingValue value, $Res Function(PhoneEditingValue) _then) = _$PhoneEditingValueCopyWithImpl;
@useResult
$Res call({
 Country? country, String nsn
});




}
/// @nodoc
class _$PhoneEditingValueCopyWithImpl<$Res>
    implements $PhoneEditingValueCopyWith<$Res> {
  _$PhoneEditingValueCopyWithImpl(this._self, this._then);

  final PhoneEditingValue _self;
  final $Res Function(PhoneEditingValue) _then;

/// Create a copy of PhoneEditingValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? country = freezed,Object? nsn = null,}) {
  return _then(_self.copyWith(
country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as Country?,nsn: null == nsn ? _self.nsn : nsn // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _PhoneEditingValue extends PhoneEditingValue {
  const _PhoneEditingValue({this.country, this.nsn = ''}): super._();
  

@override final  Country? country;
@override@JsonKey() final  String nsn;

/// Create a copy of PhoneEditingValue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhoneEditingValueCopyWith<_PhoneEditingValue> get copyWith => __$PhoneEditingValueCopyWithImpl<_PhoneEditingValue>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhoneEditingValue&&(identical(other.country, country) || other.country == country)&&(identical(other.nsn, nsn) || other.nsn == nsn));
}


@override
int get hashCode => Object.hash(runtimeType,country,nsn);

@override
String toString() {
  return 'PhoneEditingValue(country: $country, nsn: $nsn)';
}


}

/// @nodoc
abstract mixin class _$PhoneEditingValueCopyWith<$Res> implements $PhoneEditingValueCopyWith<$Res> {
  factory _$PhoneEditingValueCopyWith(_PhoneEditingValue value, $Res Function(_PhoneEditingValue) _then) = __$PhoneEditingValueCopyWithImpl;
@override @useResult
$Res call({
 Country? country, String nsn
});




}
/// @nodoc
class __$PhoneEditingValueCopyWithImpl<$Res>
    implements _$PhoneEditingValueCopyWith<$Res> {
  __$PhoneEditingValueCopyWithImpl(this._self, this._then);

  final _PhoneEditingValue _self;
  final $Res Function(_PhoneEditingValue) _then;

/// Create a copy of PhoneEditingValue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? country = freezed,Object? nsn = null,}) {
  return _then(_PhoneEditingValue(
country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as Country?,nsn: null == nsn ? _self.nsn : nsn // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
