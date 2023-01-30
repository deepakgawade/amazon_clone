import 'package:amazon_clone/common/widgets/loader_button.dart';
import 'package:amazon_clone/features/admin/models/product_model.dart';
import 'package:amazon_clone/features/admin/screens/views/add_product_screen.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:flutter/material.dart';

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
              ? const Center(child: Text("No product found"))
              : const Center(
                  child: Text("Products"),
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
