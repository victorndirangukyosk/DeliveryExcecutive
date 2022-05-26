// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'processed_products.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProcessedProducts _$ProcessedProductsFromJson(Map<String, dynamic> json) {
  return _ProcessedProducts.fromJson(json);
}

/// @nodoc
class _$ProcessedProductsTearOff {
  const _$ProcessedProductsTearOff();

  _ProcessedProducts call(
      {num? order_product_id, num? order_id, num? product_id, String? status}) {
    return _ProcessedProducts(
      order_product_id: order_product_id,
      order_id: order_id,
      product_id: product_id,
      status: status,
    );
  }

  ProcessedProducts fromJson(Map<String, Object?> json) {
    return ProcessedProducts.fromJson(json);
  }
}

/// @nodoc
const $ProcessedProducts = _$ProcessedProductsTearOff();

/// @nodoc
mixin _$ProcessedProducts {
  num? get order_product_id => throw _privateConstructorUsedError;
  num? get order_id => throw _privateConstructorUsedError;
  num? get product_id => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessedProductsCopyWith<ProcessedProducts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessedProductsCopyWith<$Res> {
  factory $ProcessedProductsCopyWith(
          ProcessedProducts value, $Res Function(ProcessedProducts) then) =
      _$ProcessedProductsCopyWithImpl<$Res>;
  $Res call(
      {num? order_product_id, num? order_id, num? product_id, String? status});
}

/// @nodoc
class _$ProcessedProductsCopyWithImpl<$Res>
    implements $ProcessedProductsCopyWith<$Res> {
  _$ProcessedProductsCopyWithImpl(this._value, this._then);

  final ProcessedProducts _value;
  // ignore: unused_field
  final $Res Function(ProcessedProducts) _then;

  @override
  $Res call({
    Object? order_product_id = freezed,
    Object? order_id = freezed,
    Object? product_id = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      order_product_id: order_product_id == freezed
          ? _value.order_product_id
          : order_product_id // ignore: cast_nullable_to_non_nullable
              as num?,
      order_id: order_id == freezed
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as num?,
      product_id: product_id == freezed
          ? _value.product_id
          : product_id // ignore: cast_nullable_to_non_nullable
              as num?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ProcessedProductsCopyWith<$Res>
    implements $ProcessedProductsCopyWith<$Res> {
  factory _$ProcessedProductsCopyWith(
          _ProcessedProducts value, $Res Function(_ProcessedProducts) then) =
      __$ProcessedProductsCopyWithImpl<$Res>;
  @override
  $Res call(
      {num? order_product_id, num? order_id, num? product_id, String? status});
}

/// @nodoc
class __$ProcessedProductsCopyWithImpl<$Res>
    extends _$ProcessedProductsCopyWithImpl<$Res>
    implements _$ProcessedProductsCopyWith<$Res> {
  __$ProcessedProductsCopyWithImpl(
      _ProcessedProducts _value, $Res Function(_ProcessedProducts) _then)
      : super(_value, (v) => _then(v as _ProcessedProducts));

  @override
  _ProcessedProducts get _value => super._value as _ProcessedProducts;

  @override
  $Res call({
    Object? order_product_id = freezed,
    Object? order_id = freezed,
    Object? product_id = freezed,
    Object? status = freezed,
  }) {
    return _then(_ProcessedProducts(
      order_product_id: order_product_id == freezed
          ? _value.order_product_id
          : order_product_id // ignore: cast_nullable_to_non_nullable
              as num?,
      order_id: order_id == freezed
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as num?,
      product_id: product_id == freezed
          ? _value.product_id
          : product_id // ignore: cast_nullable_to_non_nullable
              as num?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProcessedProducts implements _ProcessedProducts {
  _$_ProcessedProducts(
      {this.order_product_id, this.order_id, this.product_id, this.status});

  factory _$_ProcessedProducts.fromJson(Map<String, dynamic> json) =>
      _$$_ProcessedProductsFromJson(json);

  @override
  final num? order_product_id;
  @override
  final num? order_id;
  @override
  final num? product_id;
  @override
  final String? status;

  @override
  String toString() {
    return 'ProcessedProducts(order_product_id: $order_product_id, order_id: $order_id, product_id: $product_id, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProcessedProducts &&
            const DeepCollectionEquality()
                .equals(other.order_product_id, order_product_id) &&
            const DeepCollectionEquality().equals(other.order_id, order_id) &&
            const DeepCollectionEquality()
                .equals(other.product_id, product_id) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(order_product_id),
      const DeepCollectionEquality().hash(order_id),
      const DeepCollectionEquality().hash(product_id),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$ProcessedProductsCopyWith<_ProcessedProducts> get copyWith =>
      __$ProcessedProductsCopyWithImpl<_ProcessedProducts>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProcessedProductsToJson(this);
  }
}

abstract class _ProcessedProducts implements ProcessedProducts {
  factory _ProcessedProducts(
      {num? order_product_id,
      num? order_id,
      num? product_id,
      String? status}) = _$_ProcessedProducts;

  factory _ProcessedProducts.fromJson(Map<String, dynamic> json) =
      _$_ProcessedProducts.fromJson;

  @override
  num? get order_product_id;
  @override
  num? get order_id;
  @override
  num? get product_id;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$ProcessedProductsCopyWith<_ProcessedProducts> get copyWith =>
      throw _privateConstructorUsedError;
}
