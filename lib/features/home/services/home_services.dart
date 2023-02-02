import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/admin/models/product_model.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomeServices {
  Future<List<Product>> fetchCategoryProduct(
      {required String category, required BuildContext context}) async {
    final userProvider = Provider.of<UserProvider>(context).user;
    List<Product> products = [];
    try {
      var response = await Dio().get('$url/api/products?category=$category',
          options: Options(headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.token,
          }));

      dioErrorHandle(
          response: response,
          context: context,
          onSuccess: (() {
            var data = Products.fromJson(response.data);
            for (int i = 0; i < data.products.length; i++) {
              products.add(data.products[i]);
            }
          }));
    } catch (e) {
      showSnackBar(context, '$e');
    }
    return products;
  }
}
