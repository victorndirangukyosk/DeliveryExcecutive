import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_details.freezed.dart';
part 'order_details.g.dart';

@freezed
class OrderDetails with _$OrderDetails {
  factory OrderDetails({int? order_id}) = _OrderDetails;

  factory OrderDetails.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsFromJson(json);
}
