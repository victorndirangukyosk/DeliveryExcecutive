// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'place_prediction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlacePrediction _$PlacePredictionFromJson(Map<String, dynamic> json) {
  return _PlacePrediction.fromJson(json);
}

/// @nodoc
mixin _$PlacePrediction {
  StructuredFormatting? get structured_formatting =>
      throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlacePredictionCopyWith<PlacePrediction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacePredictionCopyWith<$Res> {
  factory $PlacePredictionCopyWith(
          PlacePrediction value, $Res Function(PlacePrediction) then) =
      _$PlacePredictionCopyWithImpl<$Res>;
  $Res call({StructuredFormatting? structured_formatting, String? description});

  $StructuredFormattingCopyWith<$Res>? get structured_formatting;
}

/// @nodoc
class _$PlacePredictionCopyWithImpl<$Res>
    implements $PlacePredictionCopyWith<$Res> {
  _$PlacePredictionCopyWithImpl(this._value, this._then);

  final PlacePrediction _value;
  // ignore: unused_field
  final $Res Function(PlacePrediction) _then;

  @override
  $Res call({
    Object? structured_formatting = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      structured_formatting: structured_formatting == freezed
          ? _value.structured_formatting
          : structured_formatting // ignore: cast_nullable_to_non_nullable
              as StructuredFormatting?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $StructuredFormattingCopyWith<$Res>? get structured_formatting {
    if (_value.structured_formatting == null) {
      return null;
    }

    return $StructuredFormattingCopyWith<$Res>(_value.structured_formatting!,
        (value) {
      return _then(_value.copyWith(structured_formatting: value));
    });
  }
}

/// @nodoc
abstract class _$$_PlacePredictionCopyWith<$Res>
    implements $PlacePredictionCopyWith<$Res> {
  factory _$$_PlacePredictionCopyWith(
          _$_PlacePrediction value, $Res Function(_$_PlacePrediction) then) =
      __$$_PlacePredictionCopyWithImpl<$Res>;
  @override
  $Res call({StructuredFormatting? structured_formatting, String? description});

  @override
  $StructuredFormattingCopyWith<$Res>? get structured_formatting;
}

/// @nodoc
class __$$_PlacePredictionCopyWithImpl<$Res>
    extends _$PlacePredictionCopyWithImpl<$Res>
    implements _$$_PlacePredictionCopyWith<$Res> {
  __$$_PlacePredictionCopyWithImpl(
      _$_PlacePrediction _value, $Res Function(_$_PlacePrediction) _then)
      : super(_value, (v) => _then(v as _$_PlacePrediction));

  @override
  _$_PlacePrediction get _value => super._value as _$_PlacePrediction;

  @override
  $Res call({
    Object? structured_formatting = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_PlacePrediction(
      structured_formatting == freezed
          ? _value.structured_formatting
          : structured_formatting // ignore: cast_nullable_to_non_nullable
              as StructuredFormatting?,
      description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlacePrediction implements _PlacePrediction {
  _$_PlacePrediction(this.structured_formatting, this.description);

  factory _$_PlacePrediction.fromJson(Map<String, dynamic> json) =>
      _$$_PlacePredictionFromJson(json);

  @override
  final StructuredFormatting? structured_formatting;
  @override
  final String? description;

  @override
  String toString() {
    return 'PlacePrediction(structured_formatting: $structured_formatting, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlacePrediction &&
            const DeepCollectionEquality()
                .equals(other.structured_formatting, structured_formatting) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(structured_formatting),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$$_PlacePredictionCopyWith<_$_PlacePrediction> get copyWith =>
      __$$_PlacePredictionCopyWithImpl<_$_PlacePrediction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlacePredictionToJson(
      this,
    );
  }
}

abstract class _PlacePrediction implements PlacePrediction {
  factory _PlacePrediction(final StructuredFormatting? structured_formatting,
      final String? description) = _$_PlacePrediction;

  factory _PlacePrediction.fromJson(Map<String, dynamic> json) =
      _$_PlacePrediction.fromJson;

  @override
  StructuredFormatting? get structured_formatting;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_PlacePredictionCopyWith<_$_PlacePrediction> get copyWith =>
      throw _privateConstructorUsedError;
}
