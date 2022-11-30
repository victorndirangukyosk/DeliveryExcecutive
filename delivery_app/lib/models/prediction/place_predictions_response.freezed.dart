// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'place_predictions_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlacePredictionsResponse _$PlacePredictionsResponseFromJson(
    Map<String, dynamic> json) {
  return _PlacePredictionsResponse.fromJson(json);
}

/// @nodoc
mixin _$PlacePredictionsResponse {
  List<PlacePrediction>? get predictions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlacePredictionsResponseCopyWith<PlacePredictionsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacePredictionsResponseCopyWith<$Res> {
  factory $PlacePredictionsResponseCopyWith(PlacePredictionsResponse value,
          $Res Function(PlacePredictionsResponse) then) =
      _$PlacePredictionsResponseCopyWithImpl<$Res>;
  $Res call({List<PlacePrediction>? predictions});
}

/// @nodoc
class _$PlacePredictionsResponseCopyWithImpl<$Res>
    implements $PlacePredictionsResponseCopyWith<$Res> {
  _$PlacePredictionsResponseCopyWithImpl(this._value, this._then);

  final PlacePredictionsResponse _value;
  // ignore: unused_field
  final $Res Function(PlacePredictionsResponse) _then;

  @override
  $Res call({
    Object? predictions = freezed,
  }) {
    return _then(_value.copyWith(
      predictions: predictions == freezed
          ? _value.predictions
          : predictions // ignore: cast_nullable_to_non_nullable
              as List<PlacePrediction>?,
    ));
  }
}

/// @nodoc
abstract class _$$_PlacePredictionsResponseCopyWith<$Res>
    implements $PlacePredictionsResponseCopyWith<$Res> {
  factory _$$_PlacePredictionsResponseCopyWith(
          _$_PlacePredictionsResponse value,
          $Res Function(_$_PlacePredictionsResponse) then) =
      __$$_PlacePredictionsResponseCopyWithImpl<$Res>;
  @override
  $Res call({List<PlacePrediction>? predictions});
}

/// @nodoc
class __$$_PlacePredictionsResponseCopyWithImpl<$Res>
    extends _$PlacePredictionsResponseCopyWithImpl<$Res>
    implements _$$_PlacePredictionsResponseCopyWith<$Res> {
  __$$_PlacePredictionsResponseCopyWithImpl(_$_PlacePredictionsResponse _value,
      $Res Function(_$_PlacePredictionsResponse) _then)
      : super(_value, (v) => _then(v as _$_PlacePredictionsResponse));

  @override
  _$_PlacePredictionsResponse get _value =>
      super._value as _$_PlacePredictionsResponse;

  @override
  $Res call({
    Object? predictions = freezed,
  }) {
    return _then(_$_PlacePredictionsResponse(
      predictions: predictions == freezed
          ? _value._predictions
          : predictions // ignore: cast_nullable_to_non_nullable
              as List<PlacePrediction>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlacePredictionsResponse implements _PlacePredictionsResponse {
  _$_PlacePredictionsResponse({final List<PlacePrediction>? predictions})
      : _predictions = predictions;

  factory _$_PlacePredictionsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PlacePredictionsResponseFromJson(json);

  final List<PlacePrediction>? _predictions;
  @override
  List<PlacePrediction>? get predictions {
    final value = _predictions;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PlacePredictionsResponse(predictions: $predictions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlacePredictionsResponse &&
            const DeepCollectionEquality()
                .equals(other._predictions, _predictions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_predictions));

  @JsonKey(ignore: true)
  @override
  _$$_PlacePredictionsResponseCopyWith<_$_PlacePredictionsResponse>
      get copyWith => __$$_PlacePredictionsResponseCopyWithImpl<
          _$_PlacePredictionsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlacePredictionsResponseToJson(
      this,
    );
  }
}

abstract class _PlacePredictionsResponse implements PlacePredictionsResponse {
  factory _PlacePredictionsResponse(
      {final List<PlacePrediction>? predictions}) = _$_PlacePredictionsResponse;

  factory _PlacePredictionsResponse.fromJson(Map<String, dynamic> json) =
      _$_PlacePredictionsResponse.fromJson;

  @override
  List<PlacePrediction>? get predictions;
  @override
  @JsonKey(ignore: true)
  _$$_PlacePredictionsResponseCopyWith<_$_PlacePredictionsResponse>
      get copyWith => throw _privateConstructorUsedError;
}
