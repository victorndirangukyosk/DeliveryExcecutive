import 'package:freezed_annotation/freezed_annotation.dart';

part 'processed_products.freezed.dart';
part 'processed_products.g.dart';

@freezed
class ProcessedProducts with _$ProcessedProducts {
  factory ProcessedProducts(
      {num? order_product_id,
      num? order_id,
      num? product_id,
      String? status}) = _ProcessedProducts;

  factory ProcessedProducts.fromJson(Map<String, dynamic> json) =>
      _$ProcessedProductsFromJson(json);
}
