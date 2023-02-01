import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/admin/models/product_model.dart';
import 'package:amazon_clone/providers/user_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomeServices {
  Future<List<Product>> fetchCategoryProduct(
      {required String category, required BuildContext context}) async {
    final userProvider = Provider.of<UserProvider>(context).user;
    List<Product> products = [];
    try {} catch (e) {
      showSnackBar(context, '$e');
    }
    return products;
  }
}
