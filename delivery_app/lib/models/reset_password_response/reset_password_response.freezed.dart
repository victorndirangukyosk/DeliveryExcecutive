// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reset_password_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResetPasswordResponse _$ResetPasswordResponseFromJson(
    Map<String, dynamic> json) {
  return _ResetPasswordResponse.fromJson(json);
}

/// @nodoc
class _$ResetPasswordResponseTearOff {
  const _$ResetPasswordResponseTearOff();

  _ResetPasswordResponse call({int? delivery_executive_id}) {
    return _ResetPasswordResponse(
      delivery_executive_id: delivery_executive_id,
    );
  }

  ResetPasswordResponse fromJson(Map<String, Object> json) {
    return ResetPasswordResponse.fromJson(json);
  }
}

/// @nodoc
const $ResetPasswordResponse = _$ResetPasswordResponseTearOff();

/// @nodoc
mixin _$ResetPasswordResponse {
  int? get delivery_executive_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResetPasswordResponseCopyWith<ResetPasswordResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordResponseCopyWith<$Res> {
  factory $ResetPasswordResponseCopyWith(ResetPasswordResponse value,
          $Res Function(ResetPasswordResponse) then) =
      _$ResetPasswordResponseCopyWithImpl<$Res>;
  $Res call({int? delivery_executive_id});
}

/// @nodoc
class _$ResetPasswordResponseCopyWithImpl<$Res>
    implements $ResetPasswordResponseCopyWith<$Res> {
  _$ResetPasswordResponseCopyWithImpl(this._value, this._then);

  final ResetPasswordResponse _value;
  // ignore: unused_field
  final $Res Function(ResetPasswordResponse) _then;

  @override
  $Res call({
    Object? delivery_executive_id = freezed,
  }) {
    return _then(_value.copyWith(
      delivery_executive_id: delivery_executive_id == freezed
          ? _value.delivery_executive_id
          : delivery_executive_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$ResetPasswordResponseCopyWith<$Res>
    implements $ResetPasswordResponseCopyWith<$Res> {
  factory _$ResetPasswordResponseCopyWith(_ResetPasswordResponse value,
          $Res Function(_ResetPasswordResponse) then) =
      __$ResetPasswordResponseCopyWithImpl<$Res>;
  @override
  $Res call({int? delivery_executive_id});
}

/// @nodoc
class __$ResetPasswordResponseCopyWithImpl<$Res>
    extends _$ResetPasswordResponseCopyWithImpl<$Res>
    implements _$ResetPasswordResponseCopyWith<$Res> {
  __$ResetPasswordResponseCopyWithImpl(_ResetPasswordResponse _value,
      $Res Function(_ResetPasswordResponse) _then)
      : super(_value, (v) => _then(v as _ResetPasswordResponse));

  @override
  _ResetPasswordResponse get _value => super._value as _ResetPasswordResponse;

  @override
  $Res call({
    Object? delivery_executive_id = freezed,
  }) {
    return _then(_ResetPasswordResponse(
      delivery_executive_id: delivery_executive_id == freezed
          ? _value.delivery_executive_id
          : delivery_executive_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResetPasswordResponse implements _ResetPasswordResponse {
  _$_ResetPasswordResponse({this.delivery_executive_id});

  factory _$_ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ResetPasswordResponseFromJson(json);

  @override
  final int? delivery_executive_id;

  @override
  String toString() {
    return 'ResetPasswordResponse(delivery_executive_id: $delivery_executive_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ResetPasswordResponse &&
            (identical(other.delivery_executive_id, delivery_executive_id) ||
                const DeepCollectionEquality().equals(
                    other.delivery_executive_id, delivery_executive_id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(delivery_executive_id);

  @JsonKey(ignore: true)
  @override
  _$ResetPasswordResponseCopyWith<_ResetPasswordResponse> get copyWith =>
      __$ResetPasswordResponseCopyWithImpl<_ResetPasswordResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResetPasswordResponseToJson(this);
  }
}

abstract class _ResetPasswordResponse implements ResetPasswordResponse {
  factory _ResetPasswordResponse({int? delivery_executive_id}) =
      _$_ResetPasswordResponse;

  factory _ResetPasswordResponse.fromJson(Map<String, dynamic> json) =
      _$_ResetPasswordResponse.fromJson;

  @override
  int? get delivery_executive_id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ResetPasswordResponseCopyWith<_ResetPasswordResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
