import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({super.key, required this.imgUrl});
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      //padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1.5),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          imgUrl, //,
          width: 45.w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
