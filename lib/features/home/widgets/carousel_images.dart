import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CarouselImages extends StatefulWidget {
  const CarouselImages({super.key});

  @override
  State<CarouselImages> createState() => _CarouselImagesState();
}

class _CarouselImagesState extends State<CarouselImages> {
  PageController controller = PageController(initialPage: 0);
  List<Widget> pages = [
    for (int i = 0; i < GlobalVariables.carouselImages.length; i++)
      Image.network(
        GlobalVariables.carouselImages[i],
        fit: BoxFit.cover,
        //width: 100.w,
        height: 20.h,
      )
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 20.h,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: pages,
      ),
    );
  }
}
