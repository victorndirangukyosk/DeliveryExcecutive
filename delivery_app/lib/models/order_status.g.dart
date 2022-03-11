// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderStatus _$$_OrderStatusFromJson(Map<String, dynamic> json) =>
    _$_OrderStatus(
      order_status_id: json['order_status_id'] as num?,
      language_id: json['language_id'] as num?,
      name: json['name'] as String?,
      message: json['message'] as String?,
      color: json['color'] as String?,
      sort_order: json['sort_order'] as num?,
    );

Map<String, dynamic> _$$_OrderStatusToJson(_$_OrderStatus instance) =>
    <String, dynamic>{
      'order_status_id': instance.order_status_id,
      'language_id': instance.language_id,
      'name': instance.name,
      'message': instance.message,
      'color': instance.color,
      'sort_order': instance.sort_order,
    };
