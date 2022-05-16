// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderStatus _$OrderStatusFromJson(Map<String, dynamic> json) {
  return _OrderStatus.fromJson(json);
}

/// @nodoc
class _$OrderStatusTearOff {
  const _$OrderStatusTearOff();

  _OrderStatus call(
      {num? order_status_id,
      num? language_id,
      String? name,
      String? message,
      String? color,
      num? sort_order}) {
    return _OrderStatus(
      order_status_id: order_status_id,
      language_id: language_id,
      name: name,
      message: message,
      color: color,
      sort_order: sort_order,
    );
  }

  OrderStatus fromJson(Map<String, Object?> json) {
    return OrderStatus.fromJson(json);
  }
}

/// @nodoc
const $OrderStatus = _$OrderStatusTearOff();

/// @nodoc
mixin _$OrderStatus {
  num? get order_status_id => throw _privateConstructorUsedError;
  num? get language_id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  num? get sort_order => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderStatusCopyWith<OrderStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStatusCopyWith<$Res> {
  factory $OrderStatusCopyWith(
          OrderStatus value, $Res Function(OrderStatus) then) =
      _$OrderStatusCopyWithImpl<$Res>;
  $Res call(
      {num? order_status_id,
      num? language_id,
      String? name,
      String? message,
      String? color,
      num? sort_order});
}

/// @nodoc
class _$OrderStatusCopyWithImpl<$Res> implements $OrderStatusCopyWith<$Res> {
  _$OrderStatusCopyWithImpl(this._value, this._then);

  final OrderStatus _value;
  // ignore: unused_field
  final $Res Function(OrderStatus) _then;

  @override
  $Res call({
    Object? order_status_id = freezed,
    Object? language_id = freezed,
    Object? name = freezed,
    Object? message = freezed,
    Object? color = freezed,
    Object? sort_order = freezed,
  }) {
    return _then(_value.copyWith(
      order_status_id: order_status_id == freezed
          ? _value.order_status_id
          : order_status_id // ignore: cast_nullable_to_non_nullable
              as num?,
      language_id: language_id == freezed
          ? _value.language_id
          : language_id // ignore: cast_nullable_to_non_nullable
              as num?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      sort_order: sort_order == freezed
          ? _value.sort_order
          : sort_order // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
abstract class _$OrderStatusCopyWith<$Res>
    implements $OrderStatusCopyWith<$Res> {
  factory _$OrderStatusCopyWith(
          _OrderStatus value, $Res Function(_OrderStatus) then) =
      __$OrderStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {num? order_status_id,
      num? language_id,
      String? name,
      String? message,
      String? color,
      num? sort_order});
}

/// @nodoc
class __$OrderStatusCopyWithImpl<$Res> extends _$OrderStatusCopyWithImpl<$Res>
    implements _$OrderStatusCopyWith<$Res> {
  __$OrderStatusCopyWithImpl(
      _OrderStatus _value, $Res Function(_OrderStatus) _then)
      : super(_value, (v) => _then(v as _OrderStatus));

  @override
  _OrderStatus get _value => super._value as _OrderStatus;

  @override
  $Res call({
    Object? order_status_id = freezed,
    Object? language_id = freezed,
    Object? name = freezed,
    Object? message = freezed,
    Object? color = freezed,
    Object? sort_order = freezed,
  }) {
    return _then(_OrderStatus(
      order_status_id: order_status_id == freezed
          ? _value.order_status_id
          : order_status_id // ignore: cast_nullable_to_non_nullable
              as num?,
      language_id: language_id == freezed
          ? _value.language_id
          : language_id // ignore: cast_nullable_to_non_nullable
              as num?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      sort_order: sort_order == freezed
          ? _value.sort_order
          : sort_order // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderStatus implements _OrderStatus {
  _$_OrderStatus(
      {this.order_status_id,
      this.language_id,
      this.name,
      this.message,
      this.color,
      this.sort_order});

  factory _$_OrderStatus.fromJson(Map<String, dynamic> json) =>
      _$$_OrderStatusFromJson(json);

  @override
  final num? order_status_id;
  @override
  final num? language_id;
  @override
  final String? name;
  @override
  final String? message;
  @override
  final String? color;
  @override
  final num? sort_order;

  @override
  String toString() {
    return 'OrderStatus(order_status_id: $order_status_id, language_id: $language_id, name: $name, message: $message, color: $color, sort_order: $sort_order)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderStatus &&
            const DeepCollectionEquality()
                .equals(other.order_status_id, order_status_id) &&
            const DeepCollectionEquality()
                .equals(other.language_id, language_id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality()
                .equals(other.sort_order, sort_order));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(order_status_id),
      const DeepCollectionEquality().hash(language_id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(sort_order));

  @JsonKey(ignore: true)
  @override
  _$OrderStatusCopyWith<_OrderStatus> get copyWith =>
      __$OrderStatusCopyWithImpl<_OrderStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderStatusToJson(this);
  }
}

abstract class _OrderStatus implements OrderStatus {
  factory _OrderStatus(
      {num? order_status_id,
      num? language_id,
      String? name,
      String? message,
      String? color,
      num? sort_order}) = _$_OrderStatus;

  factory _OrderStatus.fromJson(Map<String, dynamic> json) =
      _$_OrderStatus.fromJson;

  @override
  num? get order_status_id;
  @override
  num? get language_id;
  @override
  String? get name;
  @override
  String? get message;
  @override
  String? get color;
  @override
  num? get sort_order;
  @override
  @JsonKey(ignore: true)
  _$OrderStatusCopyWith<_OrderStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
