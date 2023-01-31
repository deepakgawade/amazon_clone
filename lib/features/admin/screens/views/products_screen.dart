import 'package:amazon_clone/common/widgets/loader_button.dart';
import 'package:amazon_clone/features/account/widgets/single_product.dart';
import 'package:amazon_clone/features/admin/models/product_model.dart';
import 'package:amazon_clone/features/admin/screens/views/add_product_screen.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<ProductsScreen> {
  final AdminServices service = AdminServices();
  List<Product>? products;
  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  fetchAllProducts() async {
    products = await service.fetchAllProducts(context: context);
    setState(() {});
  }

  deleteProduct(Product product, int index) async {
    await service.deleteProduct(
        product: product,
        onSucess: () {
          products!.removeAt(index);
          setState(() {});
        },
        context: context);
  }

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: products == null
          ? const LoaderButton()
          : products!.isEmpty
              ? const Center(child: Text("No products found"))
              : GridView.builder(
                  itemCount: products!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    final productData = products![index];
                    return Column(
                      children: [
                        SizedBox(
                            height: 140,
                            child:
                                SingleProduct(imgUrl: productData.images[0])),
                        SizedBox(
                          width: 44.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Text(
                                  productData.name,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              IconButton(
                                  icon: const Icon(Icons.delete_outline),
                                  onPressed: () {
                                    deleteProduct(productData, index);
                                  })
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add a Product',
        // isExtended: true,
        onPressed: navigateToAddProduct,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
