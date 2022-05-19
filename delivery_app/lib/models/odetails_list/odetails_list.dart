import 'package:freezed_annotation/freezed_annotation.dart';

part 'odetails_list.freezed.dart';
part 'odetails_list.g.dart';

@freezed
class OdetailsList with _$OdetailsList {
  factory OdetailsList({
    String? name,
    String? product_note,
    String? unit,
    String? product_store_id,
    num? product_id,
    num? price,
    num? quantity,
    num? total,
    num? tax,
  }) = _OdetailsList;

  factory OdetailsList.fromJson(Map<String, dynamic> json) =>
      _$OdetailsListFromJson(json);
}
