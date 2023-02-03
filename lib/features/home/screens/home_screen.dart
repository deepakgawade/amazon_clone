import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/features/home/widgets/carousel_images.dart';
import 'package:amazon_clone/features/home/widgets/deal_of_day.dart';
import 'package:amazon_clone/features/home/widgets/top_category.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigateToSearchScreen({required String searchQuery}) {
    Navigator.pushNamed(context, SearchScreen.routeName,
        arguments: searchQuery);
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 42,
                    margin: const EdgeInsets.only(left: 10, top: 10),
                    child: Material(
                        borderRadius: BorderRadius.circular(8),
                        elevation: 4,
                        child: TextFormField(
                          onFieldSubmitted: ((value) =>
                              navigateToSearchScreen(searchQuery: value)),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(top: 10),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black38, width: 1),
                                borderRadius: BorderRadius.circular(8)),
                            hintText: 'Search Amazon.in',
                            hintStyle: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                            prefixIcon: InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 23,
                                ),
                              ),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        )),
                  ),
                ),
                Container(
                    height: 42,
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: const Center(
                      child: Icon(
                        Icons.mic,
                        size: 23,
                        color: Colors.black,
                      ),
                    ))
              ],
            ),
          ),
          preferredSize: const Size.fromHeight(70)),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            AddressBox(),
            SizedBox(
              height: 10,
            ),
            TopCategories(),
            SizedBox(
              height: 10,
            ),
            CarouselImages(),
            DealOfDay()
          ],
        ),
      ),
    );
  }
}
