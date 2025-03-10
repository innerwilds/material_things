// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PhoneEditingValue {
  Country? get country => throw _privateConstructorUsedError;
  String get nsn => throw _privateConstructorUsedError;

  /// Create a copy of PhoneEditingValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhoneEditingValueCopyWith<PhoneEditingValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneEditingValueCopyWith<$Res> {
  factory $PhoneEditingValueCopyWith(
    PhoneEditingValue value,
    $Res Function(PhoneEditingValue) then,
  ) = _$PhoneEditingValueCopyWithImpl<$Res, PhoneEditingValue>;
  @useResult
  $Res call({Country? country, String nsn});
}

/// @nodoc
class _$PhoneEditingValueCopyWithImpl<$Res, $Val extends PhoneEditingValue>
    implements $PhoneEditingValueCopyWith<$Res> {
  _$PhoneEditingValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhoneEditingValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? country = freezed, Object? nsn = null}) {
    return _then(
      _value.copyWith(
            country:
                freezed == country
                    ? _value.country
                    : country // ignore: cast_nullable_to_non_nullable
                        as Country?,
            nsn:
                null == nsn
                    ? _value.nsn
                    : nsn // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PhoneEditingValueImplCopyWith<$Res>
    implements $PhoneEditingValueCopyWith<$Res> {
  factory _$$PhoneEditingValueImplCopyWith(
    _$PhoneEditingValueImpl value,
    $Res Function(_$PhoneEditingValueImpl) then,
  ) = __$$PhoneEditingValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Country? country, String nsn});
}

/// @nodoc
class __$$PhoneEditingValueImplCopyWithImpl<$Res>
    extends _$PhoneEditingValueCopyWithImpl<$Res, _$PhoneEditingValueImpl>
    implements _$$PhoneEditingValueImplCopyWith<$Res> {
  __$$PhoneEditingValueImplCopyWithImpl(
    _$PhoneEditingValueImpl _value,
    $Res Function(_$PhoneEditingValueImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PhoneEditingValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? country = freezed, Object? nsn = null}) {
    return _then(
      _$PhoneEditingValueImpl(
        country:
            freezed == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
                    as Country?,
        nsn:
            null == nsn
                ? _value.nsn
                : nsn // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$PhoneEditingValueImpl extends _PhoneEditingValue {
  const _$PhoneEditingValueImpl({this.country, this.nsn = ''}) : super._();

  @override
  final Country? country;
  @override
  @JsonKey()
  final String nsn;

  @override
  String toString() {
    return 'PhoneEditingValue(country: $country, nsn: $nsn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneEditingValueImpl &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.nsn, nsn) || other.nsn == nsn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, country, nsn);

  /// Create a copy of PhoneEditingValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneEditingValueImplCopyWith<_$PhoneEditingValueImpl> get copyWith =>
      __$$PhoneEditingValueImplCopyWithImpl<_$PhoneEditingValueImpl>(
        this,
        _$identity,
      );
}

abstract class _PhoneEditingValue extends PhoneEditingValue {
  const factory _PhoneEditingValue({final Country? country, final String nsn}) =
      _$PhoneEditingValueImpl;
  const _PhoneEditingValue._() : super._();

  @override
  Country? get country;
  @override
  String get nsn;

  /// Create a copy of PhoneEditingValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhoneEditingValueImplCopyWith<_$PhoneEditingValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
