// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'structured_formatting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StructuredFormatting _$StructuredFormattingFromJson(Map<String, dynamic> json) {
  return _StructuredFormatting.fromJson(json);
}

/// @nodoc
mixin _$StructuredFormatting {
  String? get main_text => throw _privateConstructorUsedError;
  String? get secondary_text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StructuredFormattingCopyWith<StructuredFormatting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StructuredFormattingCopyWith<$Res> {
  factory $StructuredFormattingCopyWith(StructuredFormatting value,
          $Res Function(StructuredFormatting) then) =
      _$StructuredFormattingCopyWithImpl<$Res>;
  $Res call({String? main_text, String? secondary_text});
}

/// @nodoc
class _$StructuredFormattingCopyWithImpl<$Res>
    implements $StructuredFormattingCopyWith<$Res> {
  _$StructuredFormattingCopyWithImpl(this._value, this._then);

  final StructuredFormatting _value;
  // ignore: unused_field
  final $Res Function(StructuredFormatting) _then;

  @override
  $Res call({
    Object? main_text = freezed,
    Object? secondary_text = freezed,
  }) {
    return _then(_value.copyWith(
      main_text: main_text == freezed
          ? _value.main_text
          : main_text // ignore: cast_nullable_to_non_nullable
              as String?,
      secondary_text: secondary_text == freezed
          ? _value.secondary_text
          : secondary_text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_StructuredFormattingCopyWith<$Res>
    implements $StructuredFormattingCopyWith<$Res> {
  factory _$$_StructuredFormattingCopyWith(_$_StructuredFormatting value,
          $Res Function(_$_StructuredFormatting) then) =
      __$$_StructuredFormattingCopyWithImpl<$Res>;
  @override
  $Res call({String? main_text, String? secondary_text});
}

/// @nodoc
class __$$_StructuredFormattingCopyWithImpl<$Res>
    extends _$StructuredFormattingCopyWithImpl<$Res>
    implements _$$_StructuredFormattingCopyWith<$Res> {
  __$$_StructuredFormattingCopyWithImpl(_$_StructuredFormatting _value,
      $Res Function(_$_StructuredFormatting) _then)
      : super(_value, (v) => _then(v as _$_StructuredFormatting));

  @override
  _$_StructuredFormatting get _value => super._value as _$_StructuredFormatting;

  @override
  $Res call({
    Object? main_text = freezed,
    Object? secondary_text = freezed,
  }) {
    return _then(_$_StructuredFormatting(
      main_text: main_text == freezed
          ? _value.main_text
          : main_text // ignore: cast_nullable_to_non_nullable
              as String?,
      secondary_text: secondary_text == freezed
          ? _value.secondary_text
          : secondary_text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StructuredFormatting implements _StructuredFormatting {
  _$_StructuredFormatting({this.main_text, this.secondary_text});

  factory _$_StructuredFormatting.fromJson(Map<String, dynamic> json) =>
      _$$_StructuredFormattingFromJson(json);

  @override
  final String? main_text;
  @override
  final String? secondary_text;

  @override
  String toString() {
    return 'StructuredFormatting(main_text: $main_text, secondary_text: $secondary_text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StructuredFormatting &&
            const DeepCollectionEquality().equals(other.main_text, main_text) &&
            const DeepCollectionEquality()
                .equals(other.secondary_text, secondary_text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(main_text),
      const DeepCollectionEquality().hash(secondary_text));

  @JsonKey(ignore: true)
  @override
  _$$_StructuredFormattingCopyWith<_$_StructuredFormatting> get copyWith =>
      __$$_StructuredFormattingCopyWithImpl<_$_StructuredFormatting>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StructuredFormattingToJson(
      this,
    );
  }
}

abstract class _StructuredFormatting implements StructuredFormatting {
  factory _StructuredFormatting(
      {final String? main_text,
      final String? secondary_text}) = _$_StructuredFormatting;

  factory _StructuredFormatting.fromJson(Map<String, dynamic> json) =
      _$_StructuredFormatting.fromJson;

  @override
  String? get main_text;
  @override
  String? get secondary_text;
  @override
  @JsonKey(ignore: true)
  _$$_StructuredFormattingCopyWith<_$_StructuredFormatting> get copyWith =>
      throw _privateConstructorUsedError;
}
