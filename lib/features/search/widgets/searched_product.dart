import 'package:amazon_clone/common/widgets/stars.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/admin/models/product_model.dart';
import 'package:flutter/material.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  const Stars(
                    rating: 4,
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
      ],
    );
  }
}
