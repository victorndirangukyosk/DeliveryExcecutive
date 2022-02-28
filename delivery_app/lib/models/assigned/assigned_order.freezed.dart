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

  _AssignedOrder call(
      {String? order_status,
      num? products_count,
      String? delivery_date,
      String? delivery_timeslot,
      String? comment,
      int? order_id}) {
    return _AssignedOrder(
      order_status: order_status,
      products_count: products_count,
      delivery_date: delivery_date,
      delivery_timeslot: delivery_timeslot,
      comment: comment,
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
  String? get order_status => throw _privateConstructorUsedError;
  num? get products_count => throw _privateConstructorUsedError;
  String? get delivery_date => throw _privateConstructorUsedError;
  String? get delivery_timeslot => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
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
  $Res call(
      {String? order_status,
      num? products_count,
      String? delivery_date,
      String? delivery_timeslot,
      String? comment,
      int? order_id});
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
    Object? order_status = freezed,
    Object? products_count = freezed,
    Object? delivery_date = freezed,
    Object? delivery_timeslot = freezed,
    Object? comment = freezed,
    Object? order_id = freezed,
  }) {
    return _then(_value.copyWith(
      order_status: order_status == freezed
          ? _value.order_status
          : order_status // ignore: cast_nullable_to_non_nullable
              as String?,
      products_count: products_count == freezed
          ? _value.products_count
          : products_count // ignore: cast_nullable_to_non_nullable
              as num?,
      delivery_date: delivery_date == freezed
          ? _value.delivery_date
          : delivery_date // ignore: cast_nullable_to_non_nullable
              as String?,
      delivery_timeslot: delivery_timeslot == freezed
          ? _value.delivery_timeslot
          : delivery_timeslot // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call(
      {String? order_status,
      num? products_count,
      String? delivery_date,
      String? delivery_timeslot,
      String? comment,
      int? order_id});
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
    Object? order_status = freezed,
    Object? products_count = freezed,
    Object? delivery_date = freezed,
    Object? delivery_timeslot = freezed,
    Object? comment = freezed,
    Object? order_id = freezed,
  }) {
    return _then(_AssignedOrder(
      order_status: order_status == freezed
          ? _value.order_status
          : order_status // ignore: cast_nullable_to_non_nullable
              as String?,
      products_count: products_count == freezed
          ? _value.products_count
          : products_count // ignore: cast_nullable_to_non_nullable
              as num?,
      delivery_date: delivery_date == freezed
          ? _value.delivery_date
          : delivery_date // ignore: cast_nullable_to_non_nullable
              as String?,
      delivery_timeslot: delivery_timeslot == freezed
          ? _value.delivery_timeslot
          : delivery_timeslot // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
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
  _$_AssignedOrder(
      {this.order_status,
      this.products_count,
      this.delivery_date,
      this.delivery_timeslot,
      this.comment,
      this.order_id});

  factory _$_AssignedOrder.fromJson(Map<String, dynamic> json) =>
      _$$_AssignedOrderFromJson(json);

  @override
  final String? order_status;
  @override
  final num? products_count;
  @override
  final String? delivery_date;
  @override
  final String? delivery_timeslot;
  @override
  final String? comment;
  @override
  final int? order_id;

  @override
  String toString() {
    return 'AssignedOrder(order_status: $order_status, products_count: $products_count, delivery_date: $delivery_date, delivery_timeslot: $delivery_timeslot, comment: $comment, order_id: $order_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssignedOrder &&
            const DeepCollectionEquality()
                .equals(other.order_status, order_status) &&
            const DeepCollectionEquality()
                .equals(other.products_count, products_count) &&
            const DeepCollectionEquality()
                .equals(other.delivery_date, delivery_date) &&
            const DeepCollectionEquality()
                .equals(other.delivery_timeslot, delivery_timeslot) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality().equals(other.order_id, order_id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(order_status),
      const DeepCollectionEquality().hash(products_count),
      const DeepCollectionEquality().hash(delivery_date),
      const DeepCollectionEquality().hash(delivery_timeslot),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(order_id));

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
  factory _AssignedOrder(
      {String? order_status,
      num? products_count,
      String? delivery_date,
      String? delivery_timeslot,
      String? comment,
      int? order_id}) = _$_AssignedOrder;

  factory _AssignedOrder.fromJson(Map<String, dynamic> json) =
      _$_AssignedOrder.fromJson;

  @override
  String? get order_status;
  @override
  num? get products_count;
  @override
  String? get delivery_date;
  @override
  String? get delivery_timeslot;
  @override
  String? get comment;
  @override
  int? get order_id;
  @override
  @JsonKey(ignore: true)
  _$AssignedOrderCopyWith<_AssignedOrder> get copyWith =>
      throw _privateConstructorUsedError;
}
