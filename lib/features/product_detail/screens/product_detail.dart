import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/stars.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/admin/models/product_model.dart';
import 'package:amazon_clone/features/home/widgets/carousel_images.dart';
import 'package:amazon_clone/features/product_detail/services/product_detail_services.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = '/product-detail-screen';
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetailsScreen> {
  final ProductDetailServices services = ProductDetailServices();

  void navigateToSearchScreen({required String searchQuery}) {
    Navigator.pushNamed(context, SearchScreen.routeName,
        arguments: searchQuery);
  }

  double avgRating = 0;
  double myrating = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    double totalRating = 0;

    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalRating += widget.product.rating![i].rating;
      if (widget.product.rating![i].userId ==
          Provider.of<UserProvider>(context).user.id) {
        myrating = widget.product.rating![i].rating;
      }
    }
    if (totalRating != 0) {
      avgRating = totalRating / widget.product.rating!.length;
    }
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
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.product.id!),
                    const Stars(
                      rating: 4,
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(
                  widget.product.name,
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              CarouselImages(
                fit: BoxFit.contain,
                items: widget.product.images,
                height: 30.h,
              ),
              Divider(
                thickness: 3,
                color: Colors.grey.shade500,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                      text: 'Deal Price: ',
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: '\$${widget.product.price}',
                          style: const TextStyle(
                              fontSize: 22,
                              color: Colors.red,
                              fontWeight: FontWeight.w500),
                        )
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.product.description,
                  maxLines: 10,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(
                thickness: 3,
                color: Colors.grey.shade500,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomButton(
                  onPressed: () {},
                  text: 'Buy Now',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomButton(
                  onPressed: () {},
                  text: 'Add to Cart',
                  color: const Color.fromRGBO(254, 216, 19, 1),
                  textColor: Colors.black,
                ),
              ),
              Divider(
                thickness: 3,
                color: Colors.grey.shade500,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Rate The Product',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  itemCount: 5,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                  itemBuilder: (context, index) {
                    return const Icon(
                      Icons.star,
                      color: GlobalVariables.secondaryColor,
                    );
                  },
                  onRatingUpdate: ((rating) {
                    services.rateProduct(
                        context: context,
                        product: widget.product,
                        rating: rating);
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
