// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_orders_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetOrdersState _$GetOrdersStateFromJson(Map<String, dynamic> json) {
  return _GetOrdersState.fromJson(json);
}

/// @nodoc
class _$GetOrdersStateTearOff {
  const _$GetOrdersStateTearOff();

  _GetOrdersState call(num? order_status_id, String? name) {
    return _GetOrdersState(
      order_status_id,
      name,
    );
  }

  GetOrdersState fromJson(Map<String, Object?> json) {
    return GetOrdersState.fromJson(json);
  }
}

/// @nodoc
const $GetOrdersState = _$GetOrdersStateTearOff();

/// @nodoc
mixin _$GetOrdersState {
  num? get order_status_id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetOrdersStateCopyWith<GetOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetOrdersStateCopyWith<$Res> {
  factory $GetOrdersStateCopyWith(
          GetOrdersState value, $Res Function(GetOrdersState) then) =
      _$GetOrdersStateCopyWithImpl<$Res>;
  $Res call({num? order_status_id, String? name});
}

/// @nodoc
class _$GetOrdersStateCopyWithImpl<$Res>
    implements $GetOrdersStateCopyWith<$Res> {
  _$GetOrdersStateCopyWithImpl(this._value, this._then);

  final GetOrdersState _value;
  // ignore: unused_field
  final $Res Function(GetOrdersState) _then;

  @override
  $Res call({
    Object? order_status_id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      order_status_id: order_status_id == freezed
          ? _value.order_status_id
          : order_status_id // ignore: cast_nullable_to_non_nullable
              as num?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$GetOrdersStateCopyWith<$Res>
    implements $GetOrdersStateCopyWith<$Res> {
  factory _$GetOrdersStateCopyWith(
          _GetOrdersState value, $Res Function(_GetOrdersState) then) =
      __$GetOrdersStateCopyWithImpl<$Res>;
  @override
  $Res call({num? order_status_id, String? name});
}

/// @nodoc
class __$GetOrdersStateCopyWithImpl<$Res>
    extends _$GetOrdersStateCopyWithImpl<$Res>
    implements _$GetOrdersStateCopyWith<$Res> {
  __$GetOrdersStateCopyWithImpl(
      _GetOrdersState _value, $Res Function(_GetOrdersState) _then)
      : super(_value, (v) => _then(v as _GetOrdersState));

  @override
  _GetOrdersState get _value => super._value as _GetOrdersState;

  @override
  $Res call({
    Object? order_status_id = freezed,
    Object? name = freezed,
  }) {
    return _then(_GetOrdersState(
      order_status_id == freezed
          ? _value.order_status_id
          : order_status_id // ignore: cast_nullable_to_non_nullable
              as num?,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetOrdersState implements _GetOrdersState {
  _$_GetOrdersState(this.order_status_id, this.name);

  factory _$_GetOrdersState.fromJson(Map<String, dynamic> json) =>
      _$$_GetOrdersStateFromJson(json);

  @override
  final num? order_status_id;
  @override
  final String? name;

  @override
  String toString() {
    return 'GetOrdersState(order_status_id: $order_status_id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetOrdersState &&
            const DeepCollectionEquality()
                .equals(other.order_status_id, order_status_id) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(order_status_id),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$GetOrdersStateCopyWith<_GetOrdersState> get copyWith =>
      __$GetOrdersStateCopyWithImpl<_GetOrdersState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetOrdersStateToJson(this);
  }
}

abstract class _GetOrdersState implements GetOrdersState {
  factory _GetOrdersState(num? order_status_id, String? name) =
      _$_GetOrdersState;

  factory _GetOrdersState.fromJson(Map<String, dynamic> json) =
      _$_GetOrdersState.fromJson;

  @override
  num? get order_status_id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$GetOrdersStateCopyWith<_GetOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}
