import 'package:amazon_clone/features/admin/models/product_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ProductsProvider extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  set setProducts(Response<dynamic> products) {
    //check length of produts and bind it to produtcs list
    notifyListeners();
  }
}
