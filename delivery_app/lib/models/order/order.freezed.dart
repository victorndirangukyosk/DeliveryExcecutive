// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
class _$OrderTearOff {
  const _$OrderTearOff();

  _Order call(
      {String? order_id,
      String? status,
      String? order_status_id,
      String? app_status,
      List<Map<String, dynamic>>? all_app_order_status,
      bool? shipped,
      String? shippng_method,
      String? date_added,
      num? products,
      num? real_products,
      String? sub_total,
      String? total,
      String? order_company,
      String? store_name}) {
    return _Order(
      order_id: order_id,
      status: status,
      order_status_id: order_status_id,
      app_status: app_status,
      all_app_order_status: all_app_order_status,
      shipped: shipped,
      shippng_method: shippng_method,
      date_added: date_added,
      products: products,
      real_products: real_products,
      sub_total: sub_total,
      total: total,
      order_company: order_company,
      store_name: store_name,
    );
  }

  Order fromJson(Map<String, Object?> json) {
    return Order.fromJson(json);
  }
}

/// @nodoc
const $Order = _$OrderTearOff();

/// @nodoc
mixin _$Order {
  String? get order_id => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get order_status_id => throw _privateConstructorUsedError;
  String? get app_status => throw _privateConstructorUsedError;
  List<Map<String, dynamic>>? get all_app_order_status =>
      throw _privateConstructorUsedError;
  bool? get shipped => throw _privateConstructorUsedError;
  String? get shippng_method => throw _privateConstructorUsedError;
  String? get date_added => throw _privateConstructorUsedError;
  num? get products => throw _privateConstructorUsedError;
  num? get real_products => throw _privateConstructorUsedError;
  String? get sub_total => throw _privateConstructorUsedError;
  String? get total => throw _privateConstructorUsedError;
  String? get order_company => throw _privateConstructorUsedError;
  String? get store_name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res>;
  $Res call(
      {String? order_id,
      String? status,
      String? order_status_id,
      String? app_status,
      List<Map<String, dynamic>>? all_app_order_status,
      bool? shipped,
      String? shippng_method,
      String? date_added,
      num? products,
      num? real_products,
      String? sub_total,
      String? total,
      String? order_company,
      String? store_name});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res> implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  final Order _value;
  // ignore: unused_field
  final $Res Function(Order) _then;

  @override
  $Res call({
    Object? order_id = freezed,
    Object? status = freezed,
    Object? order_status_id = freezed,
    Object? app_status = freezed,
    Object? all_app_order_status = freezed,
    Object? shipped = freezed,
    Object? shippng_method = freezed,
    Object? date_added = freezed,
    Object? products = freezed,
    Object? real_products = freezed,
    Object? sub_total = freezed,
    Object? total = freezed,
    Object? order_company = freezed,
    Object? store_name = freezed,
  }) {
    return _then(_value.copyWith(
      order_id: order_id == freezed
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      order_status_id: order_status_id == freezed
          ? _value.order_status_id
          : order_status_id // ignore: cast_nullable_to_non_nullable
              as String?,
      app_status: app_status == freezed
          ? _value.app_status
          : app_status // ignore: cast_nullable_to_non_nullable
              as String?,
      all_app_order_status: all_app_order_status == freezed
          ? _value.all_app_order_status
          : all_app_order_status // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      shipped: shipped == freezed
          ? _value.shipped
          : shipped // ignore: cast_nullable_to_non_nullable
              as bool?,
      shippng_method: shippng_method == freezed
          ? _value.shippng_method
          : shippng_method // ignore: cast_nullable_to_non_nullable
              as String?,
      date_added: date_added == freezed
          ? _value.date_added
          : date_added // ignore: cast_nullable_to_non_nullable
              as String?,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as num?,
      real_products: real_products == freezed
          ? _value.real_products
          : real_products // ignore: cast_nullable_to_non_nullable
              as num?,
      sub_total: sub_total == freezed
          ? _value.sub_total
          : sub_total // ignore: cast_nullable_to_non_nullable
              as String?,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String?,
      order_company: order_company == freezed
          ? _value.order_company
          : order_company // ignore: cast_nullable_to_non_nullable
              as String?,
      store_name: store_name == freezed
          ? _value.store_name
          : store_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) then) =
      __$OrderCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? order_id,
      String? status,
      String? order_status_id,
      String? app_status,
      List<Map<String, dynamic>>? all_app_order_status,
      bool? shipped,
      String? shippng_method,
      String? date_added,
      num? products,
      num? real_products,
      String? sub_total,
      String? total,
      String? order_company,
      String? store_name});
}

/// @nodoc
class __$OrderCopyWithImpl<$Res> extends _$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(_Order _value, $Res Function(_Order) _then)
      : super(_value, (v) => _then(v as _Order));

  @override
  _Order get _value => super._value as _Order;

  @override
  $Res call({
    Object? order_id = freezed,
    Object? status = freezed,
    Object? order_status_id = freezed,
    Object? app_status = freezed,
    Object? all_app_order_status = freezed,
    Object? shipped = freezed,
    Object? shippng_method = freezed,
    Object? date_added = freezed,
    Object? products = freezed,
    Object? real_products = freezed,
    Object? sub_total = freezed,
    Object? total = freezed,
    Object? order_company = freezed,
    Object? store_name = freezed,
  }) {
    return _then(_Order(
      order_id: order_id == freezed
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      order_status_id: order_status_id == freezed
          ? _value.order_status_id
          : order_status_id // ignore: cast_nullable_to_non_nullable
              as String?,
      app_status: app_status == freezed
          ? _value.app_status
          : app_status // ignore: cast_nullable_to_non_nullable
              as String?,
      all_app_order_status: all_app_order_status == freezed
          ? _value.all_app_order_status
          : all_app_order_status // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      shipped: shipped == freezed
          ? _value.shipped
          : shipped // ignore: cast_nullable_to_non_nullable
              as bool?,
      shippng_method: shippng_method == freezed
          ? _value.shippng_method
          : shippng_method // ignore: cast_nullable_to_non_nullable
              as String?,
      date_added: date_added == freezed
          ? _value.date_added
          : date_added // ignore: cast_nullable_to_non_nullable
              as String?,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as num?,
      real_products: real_products == freezed
          ? _value.real_products
          : real_products // ignore: cast_nullable_to_non_nullable
              as num?,
      sub_total: sub_total == freezed
          ? _value.sub_total
          : sub_total // ignore: cast_nullable_to_non_nullable
              as String?,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String?,
      order_company: order_company == freezed
          ? _value.order_company
          : order_company // ignore: cast_nullable_to_non_nullable
              as String?,
      store_name: store_name == freezed
          ? _value.store_name
          : store_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Order implements _Order {
  _$_Order(
      {this.order_id,
      this.status,
      this.order_status_id,
      this.app_status,
      this.all_app_order_status,
      this.shipped,
      this.shippng_method,
      this.date_added,
      this.products,
      this.real_products,
      this.sub_total,
      this.total,
      this.order_company,
      this.store_name});

  factory _$_Order.fromJson(Map<String, dynamic> json) =>
      _$$_OrderFromJson(json);

  @override
  final String? order_id;
  @override
  final String? status;
  @override
  final String? order_status_id;
  @override
  final String? app_status;
  @override
  final List<Map<String, dynamic>>? all_app_order_status;
  @override
  final bool? shipped;
  @override
  final String? shippng_method;
  @override
  final String? date_added;
  @override
  final num? products;
  @override
  final num? real_products;
  @override
  final String? sub_total;
  @override
  final String? total;
  @override
  final String? order_company;
  @override
  final String? store_name;

  @override
  String toString() {
    return 'Order(order_id: $order_id, status: $status, order_status_id: $order_status_id, app_status: $app_status, all_app_order_status: $all_app_order_status, shipped: $shipped, shippng_method: $shippng_method, date_added: $date_added, products: $products, real_products: $real_products, sub_total: $sub_total, total: $total, order_company: $order_company, store_name: $store_name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Order &&
            const DeepCollectionEquality().equals(other.order_id, order_id) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.order_status_id, order_status_id) &&
            const DeepCollectionEquality()
                .equals(other.app_status, app_status) &&
            const DeepCollectionEquality()
                .equals(other.all_app_order_status, all_app_order_status) &&
            const DeepCollectionEquality().equals(other.shipped, shipped) &&
            const DeepCollectionEquality()
                .equals(other.shippng_method, shippng_method) &&
            const DeepCollectionEquality()
                .equals(other.date_added, date_added) &&
            const DeepCollectionEquality().equals(other.products, products) &&
            const DeepCollectionEquality()
                .equals(other.real_products, real_products) &&
            const DeepCollectionEquality().equals(other.sub_total, sub_total) &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality()
                .equals(other.order_company, order_company) &&
            const DeepCollectionEquality()
                .equals(other.store_name, store_name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(order_id),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(order_status_id),
      const DeepCollectionEquality().hash(app_status),
      const DeepCollectionEquality().hash(all_app_order_status),
      const DeepCollectionEquality().hash(shipped),
      const DeepCollectionEquality().hash(shippng_method),
      const DeepCollectionEquality().hash(date_added),
      const DeepCollectionEquality().hash(products),
      const DeepCollectionEquality().hash(real_products),
      const DeepCollectionEquality().hash(sub_total),
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(order_company),
      const DeepCollectionEquality().hash(store_name));

  @JsonKey(ignore: true)
  @override
  _$OrderCopyWith<_Order> get copyWith =>
      __$OrderCopyWithImpl<_Order>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderToJson(this);
  }
}

abstract class _Order implements Order {
  factory _Order(
      {String? order_id,
      String? status,
      String? order_status_id,
      String? app_status,
      List<Map<String, dynamic>>? all_app_order_status,
      bool? shipped,
      String? shippng_method,
      String? date_added,
      num? products,
      num? real_products,
      String? sub_total,
      String? total,
      String? order_company,
      String? store_name}) = _$_Order;

  factory _Order.fromJson(Map<String, dynamic> json) = _$_Order.fromJson;

  @override
  String? get order_id;
  @override
  String? get status;
  @override
  String? get order_status_id;
  @override
  String? get app_status;
  @override
  List<Map<String, dynamic>>? get all_app_order_status;
  @override
  bool? get shipped;
  @override
  String? get shippng_method;
  @override
  String? get date_added;
  @override
  num? get products;
  @override
  num? get real_products;
  @override
  String? get sub_total;
  @override
  String? get total;
  @override
  String? get order_company;
  @override
  String? get store_name;
  @override
  @JsonKey(ignore: true)
  _$OrderCopyWith<_Order> get copyWith => throw _privateConstructorUsedError;
}
