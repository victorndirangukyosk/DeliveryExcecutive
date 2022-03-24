// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AssignedOrder _$$_AssignedOrderFromJson(Map<String, dynamic> json) =>
    _$_AssignedOrder(
      order_status: json['order_status'] as String?,
      products_count: json['products_count'] as num?,
      delivery_date: json['delivery_date'] as String?,
      delivery_timeslot: json['delivery_timeslot'] as String?,
      comment: json['comment'] as String?,
      order_id: json['order_id'] as int?,
      order_processing_group_id: json['order_processing_group_id'] as num?,
      order_processor_id: json['order_processor_id'] as num?,
    );

Map<String, dynamic> _$$_AssignedOrderToJson(_$_AssignedOrder instance) =>
    <String, dynamic>{
      'order_status': instance.order_status,
      'products_count': instance.products_count,
      'delivery_date': instance.delivery_date,
      'delivery_timeslot': instance.delivery_timeslot,
      'comment': instance.comment,
      'order_id': instance.order_id,
      'order_processing_group_id': instance.order_processing_group_id,
      'order_processor_id': instance.order_processor_id,
    };
