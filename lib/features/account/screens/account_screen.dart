import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/widgets/below_app_bar.dart';
import 'package:amazon_clone/features/account/widgets/orders.dart';
import 'package:amazon_clone/features/account/widgets/top_buttons.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: const [
                Expanded(flex: 1, child: BelowAppBar()),
              ],
            ),
            const TopButtons(),
            SizedBox(
              height: 1.h,
            ),
            const Orders(),
          ],
        ),
        appBar: PreferredSize(
            // ignore: sort_child_properties_last
            child: AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: GlobalVariables.appBarGradient),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'assets/images/amazon_in.png',
                      fit: BoxFit.fill,
                      width: 120,
                      height: 45,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.notifications_outlined,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.search_outlined,
                          color: Colors.black,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            preferredSize: const Size.fromHeight(80)),
      ),
    );
  }
}
