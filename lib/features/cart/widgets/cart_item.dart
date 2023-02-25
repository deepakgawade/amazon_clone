import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/admin/models/product_model.dart';
import 'package:amazon_clone/features/cart/services/cart_services.dart';
import 'package:amazon_clone/features/product_detail/services/product_detail_services.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.index});
  final int index;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  final CartServices services = CartServices();

  void increaseQuantity(Product product) {
    services.addToCart(context: context, product: product);
  }

  void decreaseQuantity(Product product) {
    services.removeFromCart(context: context, product: product);
  }

  @override
  Widget build(BuildContext context) {
    final product =
        context.watch<UserProvider>().user.cart![widget.index].product;
    final quantity =
        context.watch<UserProvider>().user.cart![widget.index].quantity;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Container(
                width: 135,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Image.network(
                  product.images[0],
                  //width: 135,
                  height: 135,
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 235,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(product.name,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(product.name,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: const Text('Eligible for free shipping',
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text('\$${product.price}',
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text('In Stock',
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 16,
                            color: GlobalVariables.selectedNavBarColor)),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1),
                borderRadius: BorderRadius.circular(5),
                color: Colors.black12),
            width: 150,
            // alignment: Alignment.le,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => decreaseQuantity(product),
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      child: const Icon(Icons.remove)),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    color: Colors.white,
                    child: Text('${quantity}')),
                InkWell(
                  onTap: () => increaseQuantity(product),
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      child: const Icon(Icons.add)),
                )
              ],
            ))
      ],
    );
  }
}
