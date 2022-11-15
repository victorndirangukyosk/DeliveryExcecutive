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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderDetails _$OrderDetailsFromJson(Map<String, dynamic> json) {
  return _OrderDetails.fromJson(json);
}

/// @nodoc
mixin _$OrderDetails {
// dynamic? data,
  String? get order_id => throw _privateConstructorUsedError;
  num? get products_count => throw _privateConstructorUsedError;
  String? get delivery_date => throw _privateConstructorUsedError;
  String? get delivery_timeslot => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;

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
  $Res call(
      {String? order_id,
      num? products_count,
      String? delivery_date,
      String? delivery_timeslot,
      String? comment});
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
    Object? products_count = freezed,
    Object? delivery_date = freezed,
    Object? delivery_timeslot = freezed,
    Object? comment = freezed,
  }) {
    return _then(_value.copyWith(
      order_id: order_id == freezed
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
abstract class _$$_OrderDetailsCopyWith<$Res>
    implements $OrderDetailsCopyWith<$Res> {
  factory _$$_OrderDetailsCopyWith(
          _$_OrderDetails value, $Res Function(_$_OrderDetails) then) =
      __$$_OrderDetailsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? order_id,
      num? products_count,
      String? delivery_date,
      String? delivery_timeslot,
      String? comment});
}

/// @nodoc
class __$$_OrderDetailsCopyWithImpl<$Res>
    extends _$OrderDetailsCopyWithImpl<$Res>
    implements _$$_OrderDetailsCopyWith<$Res> {
  __$$_OrderDetailsCopyWithImpl(
      _$_OrderDetails _value, $Res Function(_$_OrderDetails) _then)
      : super(_value, (v) => _then(v as _$_OrderDetails));

  @override
  _$_OrderDetails get _value => super._value as _$_OrderDetails;

  @override
  $Res call({
    Object? order_id = freezed,
    Object? products_count = freezed,
    Object? delivery_date = freezed,
    Object? delivery_timeslot = freezed,
    Object? comment = freezed,
  }) {
    return _then(_$_OrderDetails(
      order_id: order_id == freezed
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderDetails implements _OrderDetails {
  _$_OrderDetails(
      {this.order_id,
      this.products_count,
      this.delivery_date,
      this.delivery_timeslot,
      this.comment});

  factory _$_OrderDetails.fromJson(Map<String, dynamic> json) =>
      _$$_OrderDetailsFromJson(json);

// dynamic? data,
  @override
  final String? order_id;
  @override
  final num? products_count;
  @override
  final String? delivery_date;
  @override
  final String? delivery_timeslot;
  @override
  final String? comment;

  @override
  String toString() {
    return 'OrderDetails(order_id: $order_id, products_count: $products_count, delivery_date: $delivery_date, delivery_timeslot: $delivery_timeslot, comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderDetails &&
            const DeepCollectionEquality().equals(other.order_id, order_id) &&
            const DeepCollectionEquality()
                .equals(other.products_count, products_count) &&
            const DeepCollectionEquality()
                .equals(other.delivery_date, delivery_date) &&
            const DeepCollectionEquality()
                .equals(other.delivery_timeslot, delivery_timeslot) &&
            const DeepCollectionEquality().equals(other.comment, comment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(order_id),
      const DeepCollectionEquality().hash(products_count),
      const DeepCollectionEquality().hash(delivery_date),
      const DeepCollectionEquality().hash(delivery_timeslot),
      const DeepCollectionEquality().hash(comment));

  @JsonKey(ignore: true)
  @override
  _$$_OrderDetailsCopyWith<_$_OrderDetails> get copyWith =>
      __$$_OrderDetailsCopyWithImpl<_$_OrderDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderDetailsToJson(
      this,
    );
  }
}

abstract class _OrderDetails implements OrderDetails {
  factory _OrderDetails(
      {final String? order_id,
      final num? products_count,
      final String? delivery_date,
      final String? delivery_timeslot,
      final String? comment}) = _$_OrderDetails;

  factory _OrderDetails.fromJson(Map<String, dynamic> json) =
      _$_OrderDetails.fromJson;

  @override // dynamic? data,
  String? get order_id;
  @override
  num? get products_count;
  @override
  String? get delivery_date;
  @override
  String? get delivery_timeslot;
  @override
  String? get comment;
  @override
  @JsonKey(ignore: true)
  _$$_OrderDetailsCopyWith<_$_OrderDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
