import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CartSubTotal extends StatelessWidget {
  const CartSubTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    double total = 0;
    for (int i = 0; i < user.cart!.length; i++) {
      double price = user.cart![i].quantity * user.cart![i].product.price;
      total = total + price;
    }

    return Container(
      margin: const EdgeInsets.all(10),
      child: RichText(
          text: TextSpan(
              text: 'Sub-total ',
              style: const TextStyle(fontSize: 20, color: Colors.black),
              children: [
            TextSpan(
                text: '$total',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
          ])),
    );
  }
}
