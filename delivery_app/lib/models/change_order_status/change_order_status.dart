
import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_order_status.freezed.dart';
part 'change_order_status.g.dart';

@freezed
class ChangeOrderStatus with _$ChangeOrderStatus {
  factory ChangeOrderStatus(

    {
      String? tracking,
      String? paid,
      String? amount_partially_paid,
      String? vehicle_number,
      String? shipping_landmark,
      String? shipping_building_name,
      String? shipping_flat_number,
      num? customer_id,
      num? invoice_no,
      String? invoice_prefix,
    }
  ) = _ChangeOrderStatus;
	
  factory ChangeOrderStatus.fromJson(Map<String, dynamic> json) =>
			_$ChangeOrderStatusFromJson(json);
}
