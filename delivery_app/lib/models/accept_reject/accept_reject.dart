
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accept_reject.freezed.dart';
part 'accept_reject.g.dart';

@freezed
class AcceptReject with _$AcceptReject {
  factory AcceptReject({
    String? status,
    String? product_store_id,
    String? product_id,
    String? quantity,
    String? price,
    String? total,
    String? tax,
    String? name,
    String? unit,
    String? comment
  }) = _AcceptReject;
	
  factory AcceptReject.fromJson(Map<String, dynamic> json) =>
			_$AcceptRejectFromJson(json);
}
