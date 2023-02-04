import 'package:amazon_clone/common/widgets/loader_button.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/widgets/single_product.dart';
import 'package:amazon_clone/features/admin/models/product_model.dart';
import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:amazon_clone/features/product_detail/screens/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CategoryDealScreen extends StatefulWidget {
  static const String routeName = '/category-deal-screen';
  final String category;
  const CategoryDealScreen({super.key, required this.category});

  @override
  State<CategoryDealScreen> createState() => _CategoryDealScreenState();
}

class _CategoryDealScreenState extends State<CategoryDealScreen> {
  HomeServices service = HomeServices();
  List<Product>? products;

  fetchByCategoryProducts({required String category}) async {
    products = await service.fetchCategoryProduct(
        category: category, context: context);
    setState(() {});
  }

  void navigateToProductScreen({required Product product}) {
    Navigator.pushNamed(context, ProductDetailsScreen.routeName,
        arguments: product);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchByCategoryProducts(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          // ignore: sort_child_properties_last
          child: AppBar(
            centerTitle: true,
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Text(
              widget.category,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          preferredSize: const Size.fromHeight(70)),
      body: products == null
          ? const LoaderButton()
          : products!.isEmpty
              ? const Center(child: Text("No products found"))
              : Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Keep shopping for ${widget.category}',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 170,
                      child: GridView.builder(
                        itemCount: products!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          final productData = products![index];
                          return GestureDetector(
                            onTap: () =>
                                navigateToProductScreen(product: productData),
                            child: Column(
                              children: [
                                SizedBox(
                                    height: 140,
                                    child: SingleProduct(
                                        imgUrl: productData.images[0])),
                                SizedBox(
                                  width: 44.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          productData.name,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                      // IconButton(
                                      //     icon: const Icon(Icons.delete_outline),
                                      //     onPressed: () {
                                      //       deleteProduct(productData, index);
                                      //     })
                                    ],
                                  ),
                                )
                              ],
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
