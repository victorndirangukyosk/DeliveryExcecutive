// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'odetails_de.freezed.dart';
part 'odetails_de.g.dart';

@freezed
class OdetailsDe with _$OdetailsDe {
  factory OdetailsDe(
      {String? name,
      String? product_note,
      String? unit,
      String? model,
      String? product_type,
      num? general_product_id,
      num? variation_id,
      num? quantity,
      num? price,
      num? total}) = _OdetailsDe;

  factory OdetailsDe.fromJson(Map<String, dynamic> json) =>
      _$OdetailsDeFromJson(json);
}
