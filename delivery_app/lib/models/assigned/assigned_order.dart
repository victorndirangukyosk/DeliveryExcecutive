import 'package:freezed_annotation/freezed_annotation.dart';
part 'assigned_order.freezed.dart';
part 'assigned_order.g.dart';

@freezed
class AssignedOrder with _$AssignedOrder {
  factory AssignedOrder({
    int? order_id,
  }) = _AssignedOrder;

  factory AssignedOrder.fromJson(Map<String, dynamic> json) =>
      _$AssignedOrderFromJson(json);
}
