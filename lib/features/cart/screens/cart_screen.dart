import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/address/screens/address_screen.dart';
import 'package:amazon_clone/features/cart/widgets/cart_item.dart';
import 'package:amazon_clone/features/cart/widgets/cart_sub_total.dart';
import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void navigateToSearchScreen({required String searchQuery}) {
    Navigator.pushNamed(context, SearchScreen.routeName,
        arguments: searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    final userprovider = context.watch<UserProvider>();
    return Scaffold(
        appBar: PreferredSize(
            // ignore: sort_child_properties_last
            child: AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: GlobalVariables.appBarGradient),
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
            children: [
              const AddressBox(),
              const CartSubTotal(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AddressScreen.routeName);
                  },
                  text: 'Proceed to buy',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 1,
                color: Colors.black.withOpacity(0.08),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: userprovider.user.cart!.length,
                itemBuilder: (context, index) {
                  return CartItem(
                    index: index,
                  );
                },
              )
            ],
          ),
        ));
  }
}
