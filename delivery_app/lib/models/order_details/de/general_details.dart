
import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_details.freezed.dart';
part 'general_details.g.dart';

@freezed
class GeneralDetails with _$GeneralDetails {
  factory GeneralDetails(
    {
      String? order_id,
      num? products_count,
      String? vehicle_number,
      String? shipping_landmark,
      String? delivery_date,
      String? payment_method,
      String? payment_code,
      String? shipping_method,
    }
  ) = _GeneralDetails;
	
  factory GeneralDetails.fromJson(Map<String, dynamic> json) =>
			_$GeneralDetailsFromJson(json);
}
