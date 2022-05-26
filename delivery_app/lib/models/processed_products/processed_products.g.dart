// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processed_products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProcessedProducts _$$_ProcessedProductsFromJson(Map<String, dynamic> json) =>
    _$_ProcessedProducts(
      order_product_id: json['order_product_id'] as num?,
      order_id: json['order_id'] as num?,
      product_id: json['product_id'] as num?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_ProcessedProductsToJson(
        _$_ProcessedProducts instance) =>
    <String, dynamic>{
      'order_product_id': instance.order_product_id,
      'order_id': instance.order_id,
      'product_id': instance.product_id,
      'status': instance.status,
    };
