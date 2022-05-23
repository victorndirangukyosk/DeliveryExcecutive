import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_flag.freezed.dart';
part 'filter_flag.g.dart';

@freezed
class FilterFlag with _$FilterFlag {
  factory FilterFlag({
    num? order_product_id,
    num? order_id,
    num? product_id,
    num? product_general_id,
    num? quantity,
    num? price,
    num? total,
    num? tax,
    String? name,
    String? unit,
    String? status,
  }) = _FilterFlag;

  factory FilterFlag.fromJson(Map<String, dynamic> json) =>
      _$FilterFlagFromJson(json);
}
