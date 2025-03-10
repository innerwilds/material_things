// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_editing_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CountryEditingValue {
  Country? get country => throw _privateConstructorUsedError;

  /// Create a copy of CountryEditingValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CountryEditingValueCopyWith<CountryEditingValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryEditingValueCopyWith<$Res> {
  factory $CountryEditingValueCopyWith(
    CountryEditingValue value,
    $Res Function(CountryEditingValue) then,
  ) = _$CountryEditingValueCopyWithImpl<$Res, CountryEditingValue>;
  @useResult
  $Res call({Country? country});
}

/// @nodoc
class _$CountryEditingValueCopyWithImpl<$Res, $Val extends CountryEditingValue>
    implements $CountryEditingValueCopyWith<$Res> {
  _$CountryEditingValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CountryEditingValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? country = freezed}) {
    return _then(
      _value.copyWith(
            country:
                freezed == country
                    ? _value.country
                    : country // ignore: cast_nullable_to_non_nullable
                        as Country?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CountryEditingValueImplCopyWith<$Res>
    implements $CountryEditingValueCopyWith<$Res> {
  factory _$$CountryEditingValueImplCopyWith(
    _$CountryEditingValueImpl value,
    $Res Function(_$CountryEditingValueImpl) then,
  ) = __$$CountryEditingValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Country? country});
}

/// @nodoc
class __$$CountryEditingValueImplCopyWithImpl<$Res>
    extends _$CountryEditingValueCopyWithImpl<$Res, _$CountryEditingValueImpl>
    implements _$$CountryEditingValueImplCopyWith<$Res> {
  __$$CountryEditingValueImplCopyWithImpl(
    _$CountryEditingValueImpl _value,
    $Res Function(_$CountryEditingValueImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CountryEditingValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? country = freezed}) {
    return _then(
      _$CountryEditingValueImpl(
        country:
            freezed == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
                    as Country?,
      ),
    );
  }
}

/// @nodoc

class _$CountryEditingValueImpl extends _CountryEditingValue
    with DiagnosticableTreeMixin {
  const _$CountryEditingValueImpl({this.country}) : super._();

  @override
  final Country? country;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CountryEditingValue(country: $country)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CountryEditingValue'))
      ..add(DiagnosticsProperty('country', country));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryEditingValueImpl &&
            (identical(other.country, country) || other.country == country));
  }

  @override
  int get hashCode => Object.hash(runtimeType, country);

  /// Create a copy of CountryEditingValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryEditingValueImplCopyWith<_$CountryEditingValueImpl> get copyWith =>
      __$$CountryEditingValueImplCopyWithImpl<_$CountryEditingValueImpl>(
        this,
        _$identity,
      );
}

abstract class _CountryEditingValue extends CountryEditingValue {
  const factory _CountryEditingValue({final Country? country}) =
      _$CountryEditingValueImpl;
  const _CountryEditingValue._() : super._();

  @override
  Country? get country;

  /// Create a copy of CountryEditingValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountryEditingValueImplCopyWith<_$CountryEditingValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
