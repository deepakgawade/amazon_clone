import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: PreferredSize(
          // ignore: sort_child_properties_last
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 1.5.h,
                    child: TextFormField(),
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
      body: Center(
        child: Text('${user.token}'),
      ),
    );
  }
}
