// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'numeric_field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$NumericEditingValue {
  /// Whether input is valid.
  ///
  /// Gaps in cells is about invalid input, example: [1] [empty] [2].
  /// In this case [number] will be null.
  bool get isValid => throw _privateConstructorUsedError;

  /// Length of a [number]. Will be zero, if [isValid] is true.
  int get length => throw _privateConstructorUsedError;

  /// Null if [isValid] is true or if there is not any input.
  BigInt? get number => throw _privateConstructorUsedError;
  int get focusedDigit => throw _privateConstructorUsedError;

  /// Create a copy of NumericEditingValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NumericEditingValueCopyWith<NumericEditingValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumericEditingValueCopyWith<$Res> {
  factory $NumericEditingValueCopyWith(
    NumericEditingValue value,
    $Res Function(NumericEditingValue) then,
  ) = _$NumericEditingValueCopyWithImpl<$Res, NumericEditingValue>;
  @useResult
  $Res call({bool isValid, int length, BigInt? number, int focusedDigit});
}

/// @nodoc
class _$NumericEditingValueCopyWithImpl<$Res, $Val extends NumericEditingValue>
    implements $NumericEditingValueCopyWith<$Res> {
  _$NumericEditingValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NumericEditingValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = null,
    Object? length = null,
    Object? number = freezed,
    Object? focusedDigit = null,
  }) {
    return _then(
      _value.copyWith(
            isValid:
                null == isValid
                    ? _value.isValid
                    : isValid // ignore: cast_nullable_to_non_nullable
                        as bool,
            length:
                null == length
                    ? _value.length
                    : length // ignore: cast_nullable_to_non_nullable
                        as int,
            number:
                freezed == number
                    ? _value.number
                    : number // ignore: cast_nullable_to_non_nullable
                        as BigInt?,
            focusedDigit:
                null == focusedDigit
                    ? _value.focusedDigit
                    : focusedDigit // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NumericEditingValueImplCopyWith<$Res>
    implements $NumericEditingValueCopyWith<$Res> {
  factory _$$NumericEditingValueImplCopyWith(
    _$NumericEditingValueImpl value,
    $Res Function(_$NumericEditingValueImpl) then,
  ) = __$$NumericEditingValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isValid, int length, BigInt? number, int focusedDigit});
}

/// @nodoc
class __$$NumericEditingValueImplCopyWithImpl<$Res>
    extends _$NumericEditingValueCopyWithImpl<$Res, _$NumericEditingValueImpl>
    implements _$$NumericEditingValueImplCopyWith<$Res> {
  __$$NumericEditingValueImplCopyWithImpl(
    _$NumericEditingValueImpl _value,
    $Res Function(_$NumericEditingValueImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NumericEditingValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = null,
    Object? length = null,
    Object? number = freezed,
    Object? focusedDigit = null,
  }) {
    return _then(
      _$NumericEditingValueImpl(
        isValid:
            null == isValid
                ? _value.isValid
                : isValid // ignore: cast_nullable_to_non_nullable
                    as bool,
        length:
            null == length
                ? _value.length
                : length // ignore: cast_nullable_to_non_nullable
                    as int,
        number:
            freezed == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                    as BigInt?,
        focusedDigit:
            null == focusedDigit
                ? _value.focusedDigit
                : focusedDigit // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$NumericEditingValueImpl implements _NumericEditingValue {
  const _$NumericEditingValueImpl({
    required this.isValid,
    required this.length,
    this.number,
    this.focusedDigit = -1,
  });

  /// Whether input is valid.
  ///
  /// Gaps in cells is about invalid input, example: [1] [empty] [2].
  /// In this case [number] will be null.
  @override
  final bool isValid;

  /// Length of a [number]. Will be zero, if [isValid] is true.
  @override
  final int length;

  /// Null if [isValid] is true or if there is not any input.
  @override
  final BigInt? number;
  @override
  @JsonKey()
  final int focusedDigit;

  @override
  String toString() {
    return 'NumericEditingValue(isValid: $isValid, length: $length, number: $number, focusedDigit: $focusedDigit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumericEditingValueImpl &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.focusedDigit, focusedDigit) ||
                other.focusedDigit == focusedDigit));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isValid, length, number, focusedDigit);

  /// Create a copy of NumericEditingValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NumericEditingValueImplCopyWith<_$NumericEditingValueImpl> get copyWith =>
      __$$NumericEditingValueImplCopyWithImpl<_$NumericEditingValueImpl>(
        this,
        _$identity,
      );
}

abstract class _NumericEditingValue implements NumericEditingValue {
  const factory _NumericEditingValue({
    required final bool isValid,
    required final int length,
    final BigInt? number,
    final int focusedDigit,
  }) = _$NumericEditingValueImpl;

  /// Whether input is valid.
  ///
  /// Gaps in cells is about invalid input, example: [1] [empty] [2].
  /// In this case [number] will be null.
  @override
  bool get isValid;

  /// Length of a [number]. Will be zero, if [isValid] is true.
  @override
  int get length;

  /// Null if [isValid] is true or if there is not any input.
  @override
  BigInt? get number;
  @override
  int get focusedDigit;

  /// Create a copy of NumericEditingValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NumericEditingValueImplCopyWith<_$NumericEditingValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
