// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GeneralDetails _$$_GeneralDetailsFromJson(Map<String, dynamic> json) =>
    _$_GeneralDetails(
      order_id: json['order_id'] as String?,
      products_count: json['products_count'] as num?,
      vehicle_number: json['vehicle_number'] as String?,
      shipping_landmark: json['shipping_landmark'] as String?,
      delivery_date: json['delivery_date'] as String?,
      payment_method: json['payment_method'] as String?,
      payment_code: json['payment_code'] as String?,
      shipping_method: json['shipping_method'] as String?,
    );

Map<String, dynamic> _$$_GeneralDetailsToJson(_$_GeneralDetails instance) =>
    <String, dynamic>{
      'order_id': instance.order_id,
      'products_count': instance.products_count,
      'vehicle_number': instance.vehicle_number,
      'shipping_landmark': instance.shipping_landmark,
      'delivery_date': instance.delivery_date,
      'payment_method': instance.payment_method,
      'payment_code': instance.payment_code,
      'shipping_method': instance.shipping_method,
    };
