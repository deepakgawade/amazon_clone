import 'package:amazon_clone/features/product_detail/models/rating_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';

part 'product_model.g.dart';

@freezed
class Products with _$Products {
  const factory Products({
    required List<Product> products,
  }) = _Products;

  factory Products.fromJson(Map<String, Object?> json) =>
      _$ProductsFromJson(json);
}

@freezed
class Product with _$Product {
  const factory Product(
      {required String name,
      required String description,
      required double price,
      required double quantity,
      required String category,
      required List<String> images,
      String? id,
      List<Rating>? rating}) = _Product;

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);
}
