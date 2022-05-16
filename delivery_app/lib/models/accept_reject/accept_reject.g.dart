// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_reject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AcceptReject _$$_AcceptRejectFromJson(Map<String, dynamic> json) =>
    _$_AcceptReject(
      status: json['status'] as String?,
      product_store_id: json['product_store_id'] as String?,
      product_id: json['product_id'] as String?,
      quantity: json['quantity'] as String?,
      price: json['price'] as String?,
      total: json['total'] as String?,
      tax: json['tax'] as String?,
      name: json['name'] as String?,
      unit: json['unit'] as String?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$$_AcceptRejectToJson(_$_AcceptReject instance) =>
    <String, dynamic>{
      'status': instance.status,
      'product_store_id': instance.product_store_id,
      'product_id': instance.product_id,
      'quantity': instance.quantity,
      'price': instance.price,
      'total': instance.total,
      'tax': instance.tax,
      'name': instance.name,
      'unit': instance.unit,
      'comment': instance.comment,
    };
