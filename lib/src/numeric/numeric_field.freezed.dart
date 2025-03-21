// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'numeric_field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NumericEditingValue {

/// Whether input is valid.
///
/// Gaps in cells is about invalid input, example: [1] [empty] [2].
/// In this case [number] will be null.
 bool get isValid;/// Length of a [number]. Will be zero, if [isValid] is true.
 int get length;/// Null if [isValid] is true or if there is not any input.
 BigInt? get number; int get focusedDigit;
/// Create a copy of NumericEditingValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NumericEditingValueCopyWith<NumericEditingValue> get copyWith => _$NumericEditingValueCopyWithImpl<NumericEditingValue>(this as NumericEditingValue, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NumericEditingValue&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.length, length) || other.length == length)&&(identical(other.number, number) || other.number == number)&&(identical(other.focusedDigit, focusedDigit) || other.focusedDigit == focusedDigit));
}


@override
int get hashCode => Object.hash(runtimeType,isValid,length,number,focusedDigit);

@override
String toString() {
  return 'NumericEditingValue(isValid: $isValid, length: $length, number: $number, focusedDigit: $focusedDigit)';
}


}

/// @nodoc
abstract mixin class $NumericEditingValueCopyWith<$Res>  {
  factory $NumericEditingValueCopyWith(NumericEditingValue value, $Res Function(NumericEditingValue) _then) = _$NumericEditingValueCopyWithImpl;
@useResult
$Res call({
 bool isValid, int length, BigInt? number, int focusedDigit
});




}
/// @nodoc
class _$NumericEditingValueCopyWithImpl<$Res>
    implements $NumericEditingValueCopyWith<$Res> {
  _$NumericEditingValueCopyWithImpl(this._self, this._then);

  final NumericEditingValue _self;
  final $Res Function(NumericEditingValue) _then;

/// Create a copy of NumericEditingValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isValid = null,Object? length = null,Object? number = freezed,Object? focusedDigit = null,}) {
  return _then(_self.copyWith(
isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as BigInt?,focusedDigit: null == focusedDigit ? _self.focusedDigit : focusedDigit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _NumericEditingValue implements NumericEditingValue {
  const _NumericEditingValue({required this.isValid, required this.length, this.number, this.focusedDigit = -1});
  

/// Whether input is valid.
///
/// Gaps in cells is about invalid input, example: [1] [empty] [2].
/// In this case [number] will be null.
@override final  bool isValid;
/// Length of a [number]. Will be zero, if [isValid] is true.
@override final  int length;
/// Null if [isValid] is true or if there is not any input.
@override final  BigInt? number;
@override@JsonKey() final  int focusedDigit;

/// Create a copy of NumericEditingValue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NumericEditingValueCopyWith<_NumericEditingValue> get copyWith => __$NumericEditingValueCopyWithImpl<_NumericEditingValue>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NumericEditingValue&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.length, length) || other.length == length)&&(identical(other.number, number) || other.number == number)&&(identical(other.focusedDigit, focusedDigit) || other.focusedDigit == focusedDigit));
}


@override
int get hashCode => Object.hash(runtimeType,isValid,length,number,focusedDigit);

@override
String toString() {
  return 'NumericEditingValue(isValid: $isValid, length: $length, number: $number, focusedDigit: $focusedDigit)';
}


}

/// @nodoc
abstract mixin class _$NumericEditingValueCopyWith<$Res> implements $NumericEditingValueCopyWith<$Res> {
  factory _$NumericEditingValueCopyWith(_NumericEditingValue value, $Res Function(_NumericEditingValue) _then) = __$NumericEditingValueCopyWithImpl;
@override @useResult
$Res call({
 bool isValid, int length, BigInt? number, int focusedDigit
});




}
/// @nodoc
class __$NumericEditingValueCopyWithImpl<$Res>
    implements _$NumericEditingValueCopyWith<$Res> {
  __$NumericEditingValueCopyWithImpl(this._self, this._then);

  final _NumericEditingValue _self;
  final $Res Function(_NumericEditingValue) _then;

/// Create a copy of NumericEditingValue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isValid = null,Object? length = null,Object? number = freezed,Object? focusedDigit = null,}) {
  return _then(_NumericEditingValue(
isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as BigInt?,focusedDigit: null == focusedDigit ? _self.focusedDigit : focusedDigit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
