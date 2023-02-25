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

class CartServices {
  void addToCart(
      {required BuildContext context, required Product product}) async {
    debugPrint(product.id);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      var response = await Dio().post(
        '$url/api/add-to-cart',
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token
          },
        ),
        data: jsonEncode({"id": product.id}),
      );

      debugPrint(response.data.toString());

      if (context.mounted) {
        dioErrorHandle(
            response: response,
            context: context,
            onSuccess: () {
              var cart = User.fromJson(response.data).cart;
              User user = userProvider.user.copyWith(cart: cart);
              userProvider.setUserFromModel(user);
            });
      }
    } catch (e) {
      showSnackBar(context, 'Error:$e');
    }
  }

  void removeFromCart(
      {required BuildContext context, required Product product}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      var response = await Dio().delete(
        '$url/api/remove-from-cart/${product.id}',
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token
          },
        ),
      );

      debugPrint(response.data.toString());

      if (context.mounted) {
        dioErrorHandle(
            response: response,
            context: context,
            onSuccess: () {
              var cart = User.fromJson(response.data).cart;
              User user = userProvider.user.copyWith(cart: cart);
              userProvider.setUserFromModel(user);
            });
      }
    } catch (e) {
      showSnackBar(context, 'Error:$e');
    }
  }
}
