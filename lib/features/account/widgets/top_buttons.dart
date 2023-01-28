import 'package:amazon_clone/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 1.5.h,
        ),
        Row(
          children: [
            AccountButton(
              text: "Yours Order",
              onTap: () {},
            ),
            AccountButton(
              text: "Turn Seller",
              onTap: () {},
            )
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        Row(
          children: [
            AccountButton(
              text: "Log Out",
              onTap: () {},
            ),
            AccountButton(
              text: "Your Wish List",
              onTap: () {},
            )
          ],
        )
      ],
    );
  }
}
