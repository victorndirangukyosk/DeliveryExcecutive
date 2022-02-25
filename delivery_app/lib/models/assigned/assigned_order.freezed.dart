// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'assigned_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AssignedOrder _$AssignedOrderFromJson(Map<String, dynamic> json) {
  return _AssignedOrder.fromJson(json);
}

/// @nodoc
class _$AssignedOrderTearOff {
  const _$AssignedOrderTearOff();

  _AssignedOrder call({int? order_id}) {
    return _AssignedOrder(
      order_id: order_id,
    );
  }

  AssignedOrder fromJson(Map<String, Object?> json) {
    return AssignedOrder.fromJson(json);
  }
}

/// @nodoc
const $AssignedOrder = _$AssignedOrderTearOff();

/// @nodoc
mixin _$AssignedOrder {
  int? get order_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssignedOrderCopyWith<AssignedOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssignedOrderCopyWith<$Res> {
  factory $AssignedOrderCopyWith(
          AssignedOrder value, $Res Function(AssignedOrder) then) =
      _$AssignedOrderCopyWithImpl<$Res>;
  $Res call({int? order_id});
}

/// @nodoc
class _$AssignedOrderCopyWithImpl<$Res>
    implements $AssignedOrderCopyWith<$Res> {
  _$AssignedOrderCopyWithImpl(this._value, this._then);

  final AssignedOrder _value;
  // ignore: unused_field
  final $Res Function(AssignedOrder) _then;

  @override
  $Res call({
    Object? order_id = freezed,
  }) {
    return _then(_value.copyWith(
      order_id: order_id == freezed
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$AssignedOrderCopyWith<$Res>
    implements $AssignedOrderCopyWith<$Res> {
  factory _$AssignedOrderCopyWith(
          _AssignedOrder value, $Res Function(_AssignedOrder) then) =
      __$AssignedOrderCopyWithImpl<$Res>;
  @override
  $Res call({int? order_id});
}

/// @nodoc
class __$AssignedOrderCopyWithImpl<$Res>
    extends _$AssignedOrderCopyWithImpl<$Res>
    implements _$AssignedOrderCopyWith<$Res> {
  __$AssignedOrderCopyWithImpl(
      _AssignedOrder _value, $Res Function(_AssignedOrder) _then)
      : super(_value, (v) => _then(v as _AssignedOrder));

  @override
  _AssignedOrder get _value => super._value as _AssignedOrder;

  @override
  $Res call({
    Object? order_id = freezed,
  }) {
    return _then(_AssignedOrder(
      order_id: order_id == freezed
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AssignedOrder implements _AssignedOrder {
  _$_AssignedOrder({this.order_id});

  factory _$_AssignedOrder.fromJson(Map<String, dynamic> json) =>
      _$$_AssignedOrderFromJson(json);

  @override
  final int? order_id;

  @override
  String toString() {
    return 'AssignedOrder(order_id: $order_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssignedOrder &&
            const DeepCollectionEquality().equals(other.order_id, order_id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(order_id));

  @JsonKey(ignore: true)
  @override
  _$AssignedOrderCopyWith<_AssignedOrder> get copyWith =>
      __$AssignedOrderCopyWithImpl<_AssignedOrder>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssignedOrderToJson(this);
  }
}

abstract class _AssignedOrder implements AssignedOrder {
  factory _AssignedOrder({int? order_id}) = _$_AssignedOrder;

  factory _AssignedOrder.fromJson(Map<String, dynamic> json) =
      _$_AssignedOrder.fromJson;

  @override
  int? get order_id;
  @override
  @JsonKey(ignore: true)
  _$AssignedOrderCopyWith<_AssignedOrder> get copyWith =>
      throw _privateConstructorUsedError;
}
