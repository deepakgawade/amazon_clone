import 'package:amazon_clone/features/auth/model/user_model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier{
  User _user= const User(id: '', fullName: '', email: '', password: '', address: '', type: '', token: '');


  User get user => _user;

  set setuser(Response<dynamic> newUser){

    _user=User.fromJson(newUser.data);
    notifyListeners();

  }
}