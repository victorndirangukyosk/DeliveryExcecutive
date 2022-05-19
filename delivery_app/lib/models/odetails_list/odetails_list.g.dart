// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'odetails_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OdetailsList _$$_OdetailsListFromJson(Map<String, dynamic> json) =>
    _$_OdetailsList(
      name: json['name'] as String?,
      product_note: json['product_note'] as String?,
      unit: json['unit'] as String?,
      product_store_id: json['product_store_id'] as String?,
      product_id: json['product_id'] as num?,
      price: json['price'] as num?,
      quantity: json['quantity'] as num?,
      total: json['total'] as num?,
      tax: json['tax'] as num?,
    );

Map<String, dynamic> _$$_OdetailsListToJson(_$_OdetailsList instance) =>
    <String, dynamic>{
      'name': instance.name,
      'product_note': instance.product_note,
      'unit': instance.unit,
      'product_store_id': instance.product_store_id,
      'product_id': instance.product_id,
      'price': instance.price,
      'quantity': instance.quantity,
      'total': instance.total,
      'tax': instance.tax,
    };
