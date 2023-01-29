import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class DealOfDay extends StatelessWidget {
  const DealOfDay({super.key});

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
        Image.network(
          'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(top: 10, left: 10, right: 40),
          child: const Text(
            '₹ 9999',
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
