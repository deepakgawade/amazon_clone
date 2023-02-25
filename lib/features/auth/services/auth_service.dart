// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:amazon_clone/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/auth/model/user_model/user_model.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  //sign up user
  void signUpUser(
      {required BuildContext context,
      required String email,
      required String password,
      required String name}) async {
    try {
      User user = User(
          id: '',
          fullName: name,
          email: email,
          password: password,
          address: '',
          type: '',
          token: '',
          cart: []);

      var response = await Dio().post('$url/api/signup',
          options: Options(headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          }),
          data: user.toJson());

      dioErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, "Account created!Sign in with same credentials");
          });
    } on DioError catch (e) {
      if (e.response != null) {
        dioErrorHandle(
            response: e.response!,
            context: context,
            onSuccess: () {
              showSnackBar(
                  context, "Account created!Sign in with same credentials");
            });
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        log('${e.requestOptions}');
        log(e.message);
        showSnackBar(context, e.message);
      }

      log('$e');
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
          id: '',
          fullName: '',
          email: email,
          password: password,
          address: '',
          type: '',
          token: '',
          cart: []);

      var response = await Dio().post('$url/api/signin',
          options: Options(headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          }),
          data: user.toJson());

      dioErrorHandle(
          response: response,
          context: context,
          onSuccess: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            var data = User.fromJson(response.data);

            if (context.mounted) {
              Provider.of<UserProvider>(context, listen: false).setuser =
                  response;
            }

            await pref.setString('x-auth-token', data.token);

            if (context.mounted) {
              Navigator.pushNamedAndRemoveUntil(
                  context, BottomBar.routeName, (route) => false);
            }
          });
    } on DioError catch (e) {
      if (e.response != null) {
        dioErrorHandle(
            response: e.response!,
            context: context,
            onSuccess: () {
              showSnackBar(
                  context, "Account created!Sign in with same credentials");
            });
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        log('${e.requestOptions}');
        log(e.message);
        showSnackBar(context, e.message);
      }

      log('$e');
    }
  }

  void getUserData({required BuildContext context}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await Dio().post('$url/tokenIsValid',
          options: Options(headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token!
          }));

      var response = jsonDecode(tokenRes.toString())["result"];

      if (response == true) {
        var response = await Dio().get('$url/',
            options: Options(headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': token
            }));

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setuser = response;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        dioErrorHandle(
            response: e.response!,
            context: context,
            onSuccess: () {
              showSnackBar(
                  context, "Account created!Sign in with same credentials");
            });
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        log('${e.requestOptions}');
        log(e.message);
        showSnackBar(context, e.message);
      }
    }
  }
}
