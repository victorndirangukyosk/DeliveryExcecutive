// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderDetails _$OrderDetailsFromJson(Map<String, dynamic> json) {
  return _OrderDetails.fromJson(json);
}

/// @nodoc
class _$OrderDetailsTearOff {
  const _$OrderDetailsTearOff();

  _OrderDetails call({int? order_id}) {
    return _OrderDetails(
      order_id: order_id,
    );
  }

  OrderDetails fromJson(Map<String, Object?> json) {
    return OrderDetails.fromJson(json);
  }
}

/// @nodoc
const $OrderDetails = _$OrderDetailsTearOff();

/// @nodoc
mixin _$OrderDetails {
  int? get order_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderDetailsCopyWith<OrderDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailsCopyWith<$Res> {
  factory $OrderDetailsCopyWith(
          OrderDetails value, $Res Function(OrderDetails) then) =
      _$OrderDetailsCopyWithImpl<$Res>;
  $Res call({int? order_id});
}

/// @nodoc
class _$OrderDetailsCopyWithImpl<$Res> implements $OrderDetailsCopyWith<$Res> {
  _$OrderDetailsCopyWithImpl(this._value, this._then);

  final OrderDetails _value;
  // ignore: unused_field
  final $Res Function(OrderDetails) _then;

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
abstract class _$OrderDetailsCopyWith<$Res>
    implements $OrderDetailsCopyWith<$Res> {
  factory _$OrderDetailsCopyWith(
          _OrderDetails value, $Res Function(_OrderDetails) then) =
      __$OrderDetailsCopyWithImpl<$Res>;
  @override
  $Res call({int? order_id});
}

/// @nodoc
class __$OrderDetailsCopyWithImpl<$Res> extends _$OrderDetailsCopyWithImpl<$Res>
    implements _$OrderDetailsCopyWith<$Res> {
  __$OrderDetailsCopyWithImpl(
      _OrderDetails _value, $Res Function(_OrderDetails) _then)
      : super(_value, (v) => _then(v as _OrderDetails));

  @override
  _OrderDetails get _value => super._value as _OrderDetails;

  @override
  $Res call({
    Object? order_id = freezed,
  }) {
    return _then(_OrderDetails(
      order_id: order_id == freezed
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderDetails implements _OrderDetails {
  _$_OrderDetails({this.order_id});

  factory _$_OrderDetails.fromJson(Map<String, dynamic> json) =>
      _$$_OrderDetailsFromJson(json);

  @override
  final int? order_id;

  @override
  String toString() {
    return 'OrderDetails(order_id: $order_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderDetails &&
            const DeepCollectionEquality().equals(other.order_id, order_id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(order_id));

  @JsonKey(ignore: true)
  @override
  _$OrderDetailsCopyWith<_OrderDetails> get copyWith =>
      __$OrderDetailsCopyWithImpl<_OrderDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderDetailsToJson(this);
  }
}

abstract class _OrderDetails implements OrderDetails {
  factory _OrderDetails({int? order_id}) = _$_OrderDetails;

  factory _OrderDetails.fromJson(Map<String, dynamic> json) =
      _$_OrderDetails.fromJson;

  @override
  int? get order_id;
  @override
  @JsonKey(ignore: true)
  _$OrderDetailsCopyWith<_OrderDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
