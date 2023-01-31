import 'dart:convert';
import 'dart:io';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/admin/models/product_model.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    try {
      final cloudinary = CloudinaryPublic('dabms9kxc', 'fhgex49n');
      List<String> imageUrl = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary
            .uploadFile(CloudinaryFile.fromFile(images[i].path, folder: name));
        imageUrl.add(res.secureUrl);
      }

      Product product = Product(
          name: name,
          description: description,
          price: price,
          quantity: quantity,
          category: category,
          images: imageUrl);

      var response = await Dio().post(
        '$url/admin/add-product',
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': user.token
          },
        ),
        data: product.toJson(),
      );

      dioErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Product added Successfuly');
            Navigator.pop(context);
          });
    } catch (e) {
      showSnackBar(context, '$e');
    }
  }

  Future<List<Product>> fetchAllProducts({
    required BuildContext context,
  }) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    List<Product> products = [];
    try {
      var response = await Dio().get(
        '$url/admin/get-products',
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': user.token
          },
        ),
      );
      dioErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            var data = Products.fromJson(response.data);
            for (int i = 0; i < data.products.length; i++) {
              products.add(data.products[i]);
            }
          });

      return products;
    } catch (e) {
      showSnackBar(context, '$e');
      throw '$e';
    }
  }

  Future<void> deleteProduct(
      {required Product product,
      required BuildContext context,
      required VoidCallback onSucess}) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    try {
      var response = await Dio().post('$url/admin/delete-product',
          options: Options(
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': user.token
            },
          ),
          data: jsonEncode({"id": product.id}));
      dioErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            onSucess();
          });
    } catch (e) {
      showSnackBar(context, '$e');
    }
  }
}
