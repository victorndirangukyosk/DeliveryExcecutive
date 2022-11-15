import 'package:freezed_annotation/freezed_annotation.dart';

part 'assigned_de.freezed.dart';
part 'assigned_de.g.dart';

@freezed
class AssignedDe with _$AssignedDe {
  factory AssignedDe({
    String? order_status,
    num? products_count,
    String? delivery_date,
    String? delivery_timeslot,
    String? comment,
    String? shipping_address,
    num? shopper_distance,
    String? vehicle_number,
    String? shipping_building_name,
    num? delivery_executive_id,
    String? shipping_flat_number,
    int? order_id,
    String? firstname,
    String? lastname,
    String? telephone,
    String? email,
    num? customer_id,
    String? paid,
    int? amount_partialy_paid,
  }) = _AssignedDe;

  factory AssignedDe.fromJson(Map<String, dynamic> json) =>
      _$AssignedDeFromJson(json);
}
