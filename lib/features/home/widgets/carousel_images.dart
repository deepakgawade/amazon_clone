import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CarouselImages extends StatefulWidget {
  final List<String> items;
  final double height;
  final BoxFit fit;
  const CarouselImages(
      {super.key,
      required this.items,
      required this.height,
      required this.fit});

  @override
  State<CarouselImages> createState() => _CarouselImagesState();
}

class _CarouselImagesState extends State<CarouselImages> {
  PageController controller = PageController(initialPage: 0);
  List<Widget> pages = [];
  @override
  void initState() {
    super.initState();
    pages = [
      for (int i = 0; i < widget.items.length; i++)
        Image.network(
          widget.items[i],
          fit: widget.fit,
          //width: 100.w,
          height: 20.h,
        )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: widget.height,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: pages,
      ),
    );
  }
}
