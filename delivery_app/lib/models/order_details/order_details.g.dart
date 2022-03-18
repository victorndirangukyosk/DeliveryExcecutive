// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderDetails _$$_OrderDetailsFromJson(Map<String, dynamic> json) =>
    _$_OrderDetails(
      order_id: json['order_id'] as String?,
      products_count: json['products_count'] as num?,
      delivery_date: json['delivery_date'] as String?,
      delivery_timeslot: json['delivery_timeslot'] as String?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$$_OrderDetailsToJson(_$_OrderDetails instance) =>
    <String, dynamic>{
      'order_id': instance.order_id,
      'products_count': instance.products_count,
      'delivery_date': instance.delivery_date,
      'delivery_timeslot': instance.delivery_timeslot,
      'comment': instance.comment,
    };
