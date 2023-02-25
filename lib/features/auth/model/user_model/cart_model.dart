import 'package:amazon_clone/features/admin/models/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'cart_model.freezed.dart';

part 'cart_model.g.dart';

@freezed
class CartModel with _$CartModel {
  const factory CartModel({
    required Product product,
    required int quantity,

    //toekn can be added
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, Object?> json) =>
      _$CartModelFromJson(json);
}
