// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_flag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FilterFlag _$$_FilterFlagFromJson(Map<String, dynamic> json) =>
    _$_FilterFlag(
      order_product_id: json['order_product_id'] as num?,
      order_id: json['order_id'] as num?,
      product_id: json['product_id'] as num?,
      product_general_id: json['product_general_id'] as num?,
      quantity: json['quantity'] as num?,
      price: json['price'] as num?,
      total: json['total'] as num?,
      tax: json['tax'] as num?,
      name: json['name'] as String?,
      unit: json['unit'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_FilterFlagToJson(_$_FilterFlag instance) =>
    <String, dynamic>{
      'order_product_id': instance.order_product_id,
      'order_id': instance.order_id,
      'product_id': instance.product_id,
      'product_general_id': instance.product_general_id,
      'quantity': instance.quantity,
      'price': instance.price,
      'total': instance.total,
      'tax': instance.tax,
      'name': instance.name,
      'unit': instance.unit,
      'status': instance.status,
    };
