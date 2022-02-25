// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AssignedOrder _$$_AssignedOrderFromJson(Map<String, dynamic> json) =>
    _$_AssignedOrder(
      order_id: json['order_id'] as String?,
      shipping_address: json['shipping_address'] as String?,
      status: json['status'] as String?,
      order_status_id: json['order_status_id'] as String?,
      app_status: json['app_status'] as String?,
      all_app_order_status: (json['all_app_order_status'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      shipped: json['shipped'] as bool?,
      shipping_method: json['shipping_method'] as String?,
      date_added: json['date_added'] as String?,
      products: json['products'] as num?,
      real_products: json['real_products'] as num?,
      sub_total: json['sub_total'] as String?,
      total: json['total'] as String?,
      order_company: json['order_company'] as String?,
      store_name: json['store_name'] as String?,
    );

Map<String, dynamic> _$$_AssignedOrderToJson(_$_AssignedOrder instance) =>
    <String, dynamic>{
      'order_id': instance.order_id,
      'shipping_address': instance.shipping_address,
      'status': instance.status,
      'order_status_id': instance.order_status_id,
      'app_status': instance.app_status,
      'all_app_order_status': instance.all_app_order_status,
      'shipped': instance.shipped,
      'shipping_method': instance.shipping_method,
      'date_added': instance.date_added,
      'products': instance.products,
      'real_products': instance.real_products,
      'sub_total': instance.sub_total,
      'total': instance.total,
      'order_company': instance.order_company,
      'store_name': instance.store_name,
    };
