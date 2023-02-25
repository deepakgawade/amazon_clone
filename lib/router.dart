import 'package:amazon_clone/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/features/address/screens/address_screen.dart';
import 'package:amazon_clone/features/admin/models/product_model.dart';
import 'package:amazon_clone/features/admin/screens/views/add_product_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/features/home/screens/views/category_deal_screen.dart';
import 'package:amazon_clone/features/product_detail/screens/product_detail.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const HomeScreen());
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AuthScreen());
    case BottomBar.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const BottomBar());
    case AddProductScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AddProductScreen());
    case CategoryDealScreen.routeName:
      var category = routeSettings.arguments;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => CategoryDealScreen(
                category: category.toString(),
              ));
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => SearchScreen(
                seachQuery: searchQuery.toString(),
              ));

    case AddressScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AddressScreen());
    case ProductDetailsScreen.routeName:
      Product product = routeSettings.arguments as Product;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => ProductDetailsScreen(
                product: product,
              ));
    default:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const Text("Error"));
  }
}
