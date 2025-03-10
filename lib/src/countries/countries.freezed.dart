// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'countries.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Country {
  int get phoneCountryCode => throw _privateConstructorUsedError;
  String get twoLetterCode => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String? get format => throw _privateConstructorUsedError;
}

/// @nodoc

class _$CountryImpl extends _Country {
  const _$CountryImpl(
    this.phoneCountryCode,
    this.twoLetterCode,
    this.fullName, [
    this.format,
  ]) : super._();

  @override
  final int phoneCountryCode;
  @override
  final String twoLetterCode;
  @override
  final String fullName;
  @override
  final String? format;

  @override
  String toString() {
    return 'Country(phoneCountryCode: $phoneCountryCode, twoLetterCode: $twoLetterCode, fullName: $fullName, format: $format)';
  }
}

abstract class _Country extends Country {
  const factory _Country(
    final int phoneCountryCode,
    final String twoLetterCode,
    final String fullName, [
    final String? format,
  ]) = _$CountryImpl;
  const _Country._() : super._();

  @override
  int get phoneCountryCode;
  @override
  String get twoLetterCode;
  @override
  String get fullName;
  @override
  String? get format;
}
