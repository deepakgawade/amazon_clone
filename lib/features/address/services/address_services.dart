import 'dart:convert';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/auth/model/user_model/user_model.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressServices {
  void saveUserAddress({
    required BuildContext context,
    required String address,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      var response = await Dio().post('$url/api/address',
          options: Options(
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': userProvider.user.token
            },
          ),
          data: jsonEncode({'address': address}));

      if (context.mounted) {
        dioErrorHandle(
            response: response,
            context: context,
            onSuccess: () {
              User user = userProvider.user.copyWith(address: address);
              userProvider.setUserFromModel(user);
            });
      }
    } catch (e) {
      showSnackBar(context, '$e');
    }
  }
}
