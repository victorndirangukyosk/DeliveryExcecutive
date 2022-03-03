import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_details.freezed.dart';
part 'order_details.g.dart';

@freezed
class OrderDetails with _$OrderDetails {
  // ignore: non_constant_identifier_names
  factory OrderDetails({
    // dynamic? data,
    int? order_id,
    num? products_count,
    String? delivery_date,
    String? delivery_timeslot,
    String? comment,
  }) = _OrderDetails;

  factory OrderDetails.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsFromJson(json);
}
