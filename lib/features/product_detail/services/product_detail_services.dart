import 'dart:convert';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/admin/models/product_model.dart';
import 'package:amazon_clone/features/auth/model/user_model/user_model.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProductDetailServices {
  void rateProduct(
      {required BuildContext context,
      required Product product,
      required double rating}) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;

    try {
      var response = await Dio().post('$url/api/rate-product',
          options: Options(
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': user.token
            },
          ),
          data: jsonEncode({'id': product.id, 'rating': rating}));

      // ignore: use_build_context_synchronously
      dioErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Thanks for your rating');
            if (context.mounted) Navigator.pop(context);
          });
    } catch (e) {
      showSnackBar(context, 'Errro:$e');
    }
  }
}
