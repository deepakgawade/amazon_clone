import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/admin/models/product_model.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class DealOfDay extends StatelessWidget {
  final Product product;
  const DealOfDay({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10, left: 10),
          alignment: Alignment.topLeft,
          child: const Text(
            'Deal of day',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Image.network(product.images[0]),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(top: 10, left: 10, right: 40),
          child: Text(
            product.price.toString(),
            style: TextStyle(fontSize: 18),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding:
              const EdgeInsets.only(top: 10, left: 10, right: 40, bottom: 10),
          child: const Text(
            'Deepak',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1662567239284-e7b01bd4f2da?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.fitHeight,
                width: 20.w,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1662567239284-e7b01bd4f2da?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.fitHeight,
                width: 20.w,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1662567239284-e7b01bd4f2da?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.fitHeight,
                width: 20.w,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1662567239284-e7b01bd4f2da?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.fitHeight,
                width: 20.w,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1662567239284-e7b01bd4f2da?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.fitHeight,
                width: 20.w,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1662567239284-e7b01bd4f2da?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.fitHeight,
                width: 20.w,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1662567239284-e7b01bd4f2da?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.fitHeight,
                width: 20.w,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
          child: Text("See all deals",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: GlobalVariables.selectedNavBarColor)),
        )
      ],
    );
  }
}
