// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'numeric_field_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$NumericFieldThemeData {
  WidgetStateProperty<double> get gap => throw _privateConstructorUsedError;
  WidgetStateProperty<Color> get backgroundColor =>
      throw _privateConstructorUsedError;
  WidgetStateProperty<TextStyle> get textStyle =>
      throw _privateConstructorUsedError;

  /// Create a copy of NumericFieldThemeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NumericFieldThemeDataCopyWith<NumericFieldThemeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumericFieldThemeDataCopyWith<$Res> {
  factory $NumericFieldThemeDataCopyWith(
    NumericFieldThemeData value,
    $Res Function(NumericFieldThemeData) then,
  ) = _$NumericFieldThemeDataCopyWithImpl<$Res, NumericFieldThemeData>;
  @useResult
  $Res call({
    WidgetStateProperty<double> gap,
    WidgetStateProperty<Color> backgroundColor,
    WidgetStateProperty<TextStyle> textStyle,
  });
}

/// @nodoc
class _$NumericFieldThemeDataCopyWithImpl<
  $Res,
  $Val extends NumericFieldThemeData
>
    implements $NumericFieldThemeDataCopyWith<$Res> {
  _$NumericFieldThemeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NumericFieldThemeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gap = null,
    Object? backgroundColor = null,
    Object? textStyle = null,
  }) {
    return _then(
      _value.copyWith(
            gap:
                null == gap
                    ? _value.gap
                    : gap // ignore: cast_nullable_to_non_nullable
                        as WidgetStateProperty<double>,
            backgroundColor:
                null == backgroundColor
                    ? _value.backgroundColor
                    : backgroundColor // ignore: cast_nullable_to_non_nullable
                        as WidgetStateProperty<Color>,
            textStyle:
                null == textStyle
                    ? _value.textStyle
                    : textStyle // ignore: cast_nullable_to_non_nullable
                        as WidgetStateProperty<TextStyle>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NumericFieldThemeDataImplCopyWith<$Res>
    implements $NumericFieldThemeDataCopyWith<$Res> {
  factory _$$NumericFieldThemeDataImplCopyWith(
    _$NumericFieldThemeDataImpl value,
    $Res Function(_$NumericFieldThemeDataImpl) then,
  ) = __$$NumericFieldThemeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    WidgetStateProperty<double> gap,
    WidgetStateProperty<Color> backgroundColor,
    WidgetStateProperty<TextStyle> textStyle,
  });
}

/// @nodoc
class __$$NumericFieldThemeDataImplCopyWithImpl<$Res>
    extends
        _$NumericFieldThemeDataCopyWithImpl<$Res, _$NumericFieldThemeDataImpl>
    implements _$$NumericFieldThemeDataImplCopyWith<$Res> {
  __$$NumericFieldThemeDataImplCopyWithImpl(
    _$NumericFieldThemeDataImpl _value,
    $Res Function(_$NumericFieldThemeDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NumericFieldThemeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gap = null,
    Object? backgroundColor = null,
    Object? textStyle = null,
  }) {
    return _then(
      _$NumericFieldThemeDataImpl(
        gap:
            null == gap
                ? _value.gap
                : gap // ignore: cast_nullable_to_non_nullable
                    as WidgetStateProperty<double>,
        backgroundColor:
            null == backgroundColor
                ? _value.backgroundColor
                : backgroundColor // ignore: cast_nullable_to_non_nullable
                    as WidgetStateProperty<Color>,
        textStyle:
            null == textStyle
                ? _value.textStyle
                : textStyle // ignore: cast_nullable_to_non_nullable
                    as WidgetStateProperty<TextStyle>,
      ),
    );
  }
}

/// @nodoc

class _$NumericFieldThemeDataImpl implements _NumericFieldThemeData {
  const _$NumericFieldThemeDataImpl({
    required this.gap,
    required this.backgroundColor,
    required this.textStyle,
  });

  @override
  final WidgetStateProperty<double> gap;
  @override
  final WidgetStateProperty<Color> backgroundColor;
  @override
  final WidgetStateProperty<TextStyle> textStyle;

  @override
  String toString() {
    return 'NumericFieldThemeData(gap: $gap, backgroundColor: $backgroundColor, textStyle: $textStyle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumericFieldThemeDataImpl &&
            (identical(other.gap, gap) || other.gap == gap) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.textStyle, textStyle) ||
                other.textStyle == textStyle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, gap, backgroundColor, textStyle);

  /// Create a copy of NumericFieldThemeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NumericFieldThemeDataImplCopyWith<_$NumericFieldThemeDataImpl>
  get copyWith =>
      __$$NumericFieldThemeDataImplCopyWithImpl<_$NumericFieldThemeDataImpl>(
        this,
        _$identity,
      );
}

abstract class _NumericFieldThemeData implements NumericFieldThemeData {
  const factory _NumericFieldThemeData({
    required final WidgetStateProperty<double> gap,
    required final WidgetStateProperty<Color> backgroundColor,
    required final WidgetStateProperty<TextStyle> textStyle,
  }) = _$NumericFieldThemeDataImpl;

  @override
  WidgetStateProperty<double> get gap;
  @override
  WidgetStateProperty<Color> get backgroundColor;
  @override
  WidgetStateProperty<TextStyle> get textStyle;

  /// Create a copy of NumericFieldThemeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NumericFieldThemeDataImplCopyWith<_$NumericFieldThemeDataImpl>
  get copyWith => throw _privateConstructorUsedError;
}
