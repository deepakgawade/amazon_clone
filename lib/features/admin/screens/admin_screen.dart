import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/admin/screens/views/products_screen.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const Center(
      child: Text('Admin Page'),
    ),
    const Center(
      child: Text('Analytics Page'),
    ),
    const ProductsScreen()
  ];
  // Widget pageBuilder(){
  //   return Page

  // }
  updatePage(int value) {
    setState(
      () {
        page = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    child: const Text(
                      'Admin',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 17),
                    ))
              ],
            ),
          ),
          preferredSize: const Size.fromHeight(60)),
      body: pages[page],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: page == 0
                            ? GlobalVariables.selectedNavBarColor
                            : GlobalVariables.backgroundColor,
                        width: bottomBarBorderWidth)),
              ),
              child: const Icon(Icons.home_outlined),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: page == 1
                            ? GlobalVariables.selectedNavBarColor
                            : GlobalVariables.backgroundColor,
                        width: bottomBarBorderWidth)),
              ),
              child: const Icon(Icons.analytics_outlined),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: page == 2
                            ? GlobalVariables.selectedNavBarColor
                            : GlobalVariables.backgroundColor,
                        width: bottomBarBorderWidth)),
              ),
              child: const Icon(Icons.all_inbox_outlined),
            ),
          ),
        ],
        currentIndex: page,
        onTap: updatePage,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        iconSize: 28,
      ),
    );
  }
}
