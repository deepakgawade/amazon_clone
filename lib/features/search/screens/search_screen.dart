import 'package:amazon_clone/common/widgets/loader_button.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/widgets/single_product.dart';
import 'package:amazon_clone/features/admin/models/product_model.dart';
import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/features/product_detail/screens/product_detail.dart';
import 'package:amazon_clone/features/search/services/search_services.dart';
import 'package:amazon_clone/features/search/widgets/searched_product.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String seachQuery;
  const SearchScreen({super.key, required this.seachQuery});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? products;

  final SearchService service = SearchService();
  
  void navigateToSearchScreen({required String searchQuery}) {
    Navigator.pushNamed(context, SearchScreen.routeName,
        arguments: searchQuery);
  }

  void navigateToProductScreen({required Product product}) {
    Navigator.pushNamed(context, ProductDetailsScreen.routeName,
        arguments: product);
  }

  void fetchAllProducts() async {
    products = await service.searchProducts(
        context: context, query: widget.seachQuery);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
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
      body: products == null
          ? const LoaderButton()
          : products!.isEmpty
              ? const Center(child: Text("No products found"))
              : Column(
                  children: [
                    const AddressBox(),
                    SizedBox(
                      height: 1.h,
                    ),
                    SizedBox(
                      height: 170,
                      child: ListView.builder(
                        itemCount: products!.length,
                        itemBuilder: (context, index) {
                          final productData = products![index];
                          return GestureDetector(
                            onTap: () =>
                                navigateToProductScreen(product: productData),
                            child: SearchedProduct(
                              product: productData,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
    );
  }
}
