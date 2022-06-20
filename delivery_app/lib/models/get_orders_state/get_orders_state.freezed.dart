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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetOrdersState _$GetOrdersStateFromJson(Map<String, dynamic> json) {
  return _GetOrdersState.fromJson(json);
}

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
abstract class _$$_GetOrdersStateCopyWith<$Res>
    implements $GetOrdersStateCopyWith<$Res> {
  factory _$$_GetOrdersStateCopyWith(
          _$_GetOrdersState value, $Res Function(_$_GetOrdersState) then) =
      __$$_GetOrdersStateCopyWithImpl<$Res>;
  @override
  $Res call({num? order_status_id, String? name});
}

/// @nodoc
class __$$_GetOrdersStateCopyWithImpl<$Res>
    extends _$GetOrdersStateCopyWithImpl<$Res>
    implements _$$_GetOrdersStateCopyWith<$Res> {
  __$$_GetOrdersStateCopyWithImpl(
      _$_GetOrdersState _value, $Res Function(_$_GetOrdersState) _then)
      : super(_value, (v) => _then(v as _$_GetOrdersState));

  @override
  _$_GetOrdersState get _value => super._value as _$_GetOrdersState;

  @override
  $Res call({
    Object? order_status_id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_GetOrdersState(
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
            other is _$_GetOrdersState &&
            const DeepCollectionEquality()
                .equals(other.order_status_id, order_status_id) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(order_status_id),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_GetOrdersStateCopyWith<_$_GetOrdersState> get copyWith =>
      __$$_GetOrdersStateCopyWithImpl<_$_GetOrdersState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetOrdersStateToJson(this);
  }
}

abstract class _GetOrdersState implements GetOrdersState {
  factory _GetOrdersState(final num? order_status_id, final String? name) =
      _$_GetOrdersState;

  factory _GetOrdersState.fromJson(Map<String, dynamic> json) =
      _$_GetOrdersState.fromJson;

  @override
  num? get order_status_id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GetOrdersStateCopyWith<_$_GetOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}
