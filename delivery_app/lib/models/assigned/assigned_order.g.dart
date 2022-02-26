// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AssignedOrder _$$_AssignedOrderFromJson(Map<String, dynamic> json) =>
    _$_AssignedOrder(
      order_status: json['order_status'] as String?,
      products_count: json['products_count'] as String?,
      order_id: json['order_id'] as int?,
    );

Map<String, dynamic> _$$_AssignedOrderToJson(_$_AssignedOrder instance) =>
    <String, dynamic>{
      'order_status': instance.order_status,
      'products_count': instance.products_count,
      'order_id': instance.order_id,
    };
