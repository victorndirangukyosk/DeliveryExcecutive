// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_order_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChangeOrderStatus _$$_ChangeOrderStatusFromJson(Map<String, dynamic> json) =>
    _$_ChangeOrderStatus(
      tracking: json['tracking'] as String?,
      paid: json['paid'] as String?,
      amount_partially_paid: json['amount_partially_paid'] as String?,
      vehicle_number: json['vehicle_number'] as String?,
      shipping_landmark: json['shipping_landmark'] as String?,
      shipping_building_name: json['shipping_building_name'] as String?,
      shipping_flat_number: json['shipping_flat_number'] as String?,
      customer_id: json['customer_id'] as num?,
      invoice_no: json['invoice_no'] as num?,
      invoice_prefix: json['invoice_prefix'] as String?,
    );

Map<String, dynamic> _$$_ChangeOrderStatusToJson(
        _$_ChangeOrderStatus instance) =>
    <String, dynamic>{
      'tracking': instance.tracking,
      'paid': instance.paid,
      'amount_partially_paid': instance.amount_partially_paid,
      'vehicle_number': instance.vehicle_number,
      'shipping_landmark': instance.shipping_landmark,
      'shipping_building_name': instance.shipping_building_name,
      'shipping_flat_number': instance.shipping_flat_number,
      'customer_id': instance.customer_id,
      'invoice_no': instance.invoice_no,
      'invoice_prefix': instance.invoice_prefix,
    };
