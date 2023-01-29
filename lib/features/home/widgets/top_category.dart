import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TopCategories extends StatefulWidget {
  const TopCategories({super.key});

  @override
  State<TopCategories> createState() => _TopCategoryState();
}

class _TopCategoryState extends State<TopCategories> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: GlobalVariables.categoryImages.length,
          itemExtent: 20.w,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      fit: BoxFit.cover,
                      '${GlobalVariables.categoryImages[index]['image']}',
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                Text('${GlobalVariables.categoryImages[index]['title']}',
                    style: Theme.of(context).textTheme.bodySmall)
              ],
            );
          }),
    );
  }
}