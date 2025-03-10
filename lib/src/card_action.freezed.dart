// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CardActionThemeData {
  WidgetStateProperty<EdgeInsets>? get padding =>
      throw _privateConstructorUsedError;
  WidgetStateProperty<TextStyle>? get textStyle =>
      throw _privateConstructorUsedError;

  /// Create a copy of CardActionThemeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CardActionThemeDataCopyWith<CardActionThemeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardActionThemeDataCopyWith<$Res> {
  factory $CardActionThemeDataCopyWith(
    CardActionThemeData value,
    $Res Function(CardActionThemeData) then,
  ) = _$CardActionThemeDataCopyWithImpl<$Res, CardActionThemeData>;
  @useResult
  $Res call({
    WidgetStateProperty<EdgeInsets>? padding,
    WidgetStateProperty<TextStyle>? textStyle,
  });
}

/// @nodoc
class _$CardActionThemeDataCopyWithImpl<$Res, $Val extends CardActionThemeData>
    implements $CardActionThemeDataCopyWith<$Res> {
  _$CardActionThemeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CardActionThemeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? padding = freezed, Object? textStyle = freezed}) {
    return _then(
      _value.copyWith(
            padding:
                freezed == padding
                    ? _value.padding
                    : padding // ignore: cast_nullable_to_non_nullable
                        as WidgetStateProperty<EdgeInsets>?,
            textStyle:
                freezed == textStyle
                    ? _value.textStyle
                    : textStyle // ignore: cast_nullable_to_non_nullable
                        as WidgetStateProperty<TextStyle>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CardActionThemeDataImplCopyWith<$Res>
    implements $CardActionThemeDataCopyWith<$Res> {
  factory _$$CardActionThemeDataImplCopyWith(
    _$CardActionThemeDataImpl value,
    $Res Function(_$CardActionThemeDataImpl) then,
  ) = __$$CardActionThemeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    WidgetStateProperty<EdgeInsets>? padding,
    WidgetStateProperty<TextStyle>? textStyle,
  });
}

/// @nodoc
class __$$CardActionThemeDataImplCopyWithImpl<$Res>
    extends _$CardActionThemeDataCopyWithImpl<$Res, _$CardActionThemeDataImpl>
    implements _$$CardActionThemeDataImplCopyWith<$Res> {
  __$$CardActionThemeDataImplCopyWithImpl(
    _$CardActionThemeDataImpl _value,
    $Res Function(_$CardActionThemeDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CardActionThemeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? padding = freezed, Object? textStyle = freezed}) {
    return _then(
      _$CardActionThemeDataImpl(
        padding:
            freezed == padding
                ? _value.padding
                : padding // ignore: cast_nullable_to_non_nullable
                    as WidgetStateProperty<EdgeInsets>?,
        textStyle:
            freezed == textStyle
                ? _value.textStyle
                : textStyle // ignore: cast_nullable_to_non_nullable
                    as WidgetStateProperty<TextStyle>?,
      ),
    );
  }
}

/// @nodoc

class _$CardActionThemeDataImpl implements _CardActionThemeData {
  const _$CardActionThemeDataImpl({this.padding, this.textStyle});

  @override
  final WidgetStateProperty<EdgeInsets>? padding;
  @override
  final WidgetStateProperty<TextStyle>? textStyle;

  @override
  String toString() {
    return 'CardActionThemeData(padding: $padding, textStyle: $textStyle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardActionThemeDataImpl &&
            (identical(other.padding, padding) || other.padding == padding) &&
            (identical(other.textStyle, textStyle) ||
                other.textStyle == textStyle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, padding, textStyle);

  /// Create a copy of CardActionThemeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CardActionThemeDataImplCopyWith<_$CardActionThemeDataImpl> get copyWith =>
      __$$CardActionThemeDataImplCopyWithImpl<_$CardActionThemeDataImpl>(
        this,
        _$identity,
      );
}

abstract class _CardActionThemeData implements CardActionThemeData {
  const factory _CardActionThemeData({
    final WidgetStateProperty<EdgeInsets>? padding,
    final WidgetStateProperty<TextStyle>? textStyle,
  }) = _$CardActionThemeDataImpl;

  @override
  WidgetStateProperty<EdgeInsets>? get padding;
  @override
  WidgetStateProperty<TextStyle>? get textStyle;

  /// Create a copy of CardActionThemeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CardActionThemeDataImplCopyWith<_$CardActionThemeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
