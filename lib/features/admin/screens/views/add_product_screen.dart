import 'dart:io';

import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product-screen';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  PageController controller = PageController();
  TextEditingController productNameContoller = TextEditingController();
  TextEditingController descriptionContoller = TextEditingController();

  TextEditingController priceContoller = TextEditingController();

  TextEditingController quantitycontoller = TextEditingController();
  final AdminServices service = AdminServices();
  final productformkey = GlobalKey<FormState>();
  String category = 'Mobiles';
  List<String> itemList = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];

  List<File> images = [];
  List<Widget> getImages() {
    List<Widget> pages = [
      for (int i = 0; i < images.length; i++)
        Image.file(
          images[i],
          fit: BoxFit.cover,
          //width: 100.w,
          height: 20.h,
        )
    ];
    return pages;
  }

  Future<void> selectImage() async {
    var res = await pickImage();
    setState(() {
      images = res;
    });
  }

  sellProduct() {
    if (productformkey.currentState!.validate() && images.isNotEmpty) {
      service.sellProduct(
          context: context,
          name: productNameContoller.text,
          description: descriptionContoller.text,
          price: double.parse(priceContoller.text),
          quantity: double.parse(quantitycontoller.text),
          category: category,
          images: images);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    productNameContoller.dispose();
    descriptionContoller.dispose();
    priceContoller.dispose();
    quantitycontoller.dispose();
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
            title: const Text(
              'Add Product',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          preferredSize: const Size.fromHeight(60)),
      body: SingleChildScrollView(
        child: Form(
          key: productformkey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                images.isNotEmpty
                    ? SizedBox(
                        width: 100.w,
                        height: 20.h,
                        child: PageView(
                          controller: controller,
                          scrollDirection: Axis.horizontal,
                          children: getImages(),
                        ),
                      )
                    : GestureDetector(
                        onTap: selectImage,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            height: 20.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.folder_open),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Select Product Image',
                                  style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 1.h,
                ),
                CustomTextField(
                    controller: productNameContoller, hintText: 'Product Name'),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    maxlines: 7,
                    controller: descriptionContoller,
                    hintText: 'Description'),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(controller: priceContoller, hintText: 'Price'),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: quantitycontoller, hintText: 'Quantity'),
                SizedBox(
                  width: 90.w,
                  child: DropdownButton<String>(
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      value: category,
                      items: itemList
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          category = value!;
                        });
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(onPressed: sellProduct, text: 'Sell')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
