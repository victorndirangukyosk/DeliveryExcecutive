import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_status.freezed.dart';
part 'order_status.g.dart';

@freezed
class OrderStatus with _$OrderStatus {
  factory OrderStatus(
      {num? order_status_id,
      num? language_id,
      String? name,
      String? message,
      String? color,
      num? sort_order}) = _OrderStatus;

  factory OrderStatus.fromJson(Map<String, dynamic> json) =>
      _$OrderStatusFromJson(json);
}
