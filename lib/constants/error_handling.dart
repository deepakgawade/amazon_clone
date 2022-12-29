import 'package:amazon_clone/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;

void dioErrorHandle(
    {required dio.Response response,
    required BuildContext context,
    required VoidCallback onSuccess}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, response.data['msg']);
      break;
    case 500:
      showSnackBar(context, response.data['error']);
      break;
    default:
      showSnackBar(context, response.data);
  }
}
