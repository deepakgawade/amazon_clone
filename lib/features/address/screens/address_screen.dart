import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:flutter/material.dart';
// import 'package:pay/pay.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = "/address-screen";
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  void navigateToSearchScreen({required String searchQuery}) {
    Navigator.pushNamed(context, SearchScreen.routeName,
        arguments: searchQuery);
  }

  void onGooglePayResult(paymentResult) {
    // Send the resulting Google Pay token to your server / PSP
  }

  final _addressFormKey = GlobalKey<FormState>();
  final TextEditingController _flatController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  // final Future<PaymentConfiguration> _googlePayConfigFuture =
  //     PaymentConfiguration.fromAsset('gpay.json');
  // List<PaymentItem> payItem = [];

  @override
  void dispose() {
    _flatController.dispose();
    _areaController.dispose();
    _cityController.dispose();
    _pinController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var address = 'sajf;jf'; //context.watch<UserProvider>().user.address;
    return Scaffold(
      appBar: PreferredSize(
        // ignore: sort_child_properties_last
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
        ),
        preferredSize: const Size.fromHeight(70),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _addressFormKey,
              child: SingleChildScrollView(
                child: Container(
                  color: GlobalVariables.backgroundColor,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      if (address.isNotEmpty)
                        Column(
                          children: [
                            Container(
                                padding: EdgeInsets.all(8),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  width: 1,
                                  color: Colors.black26,
                                )),
                                child: Text(
                                  address,
                                  style: const TextStyle(fontSize: 18),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            const Text('OR'),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      CustomTextField(
                          controller: _flatController,
                          hintText: "flat, House no, building",
                          validator: (value) {
                            if (value!.length > 5) {
                              return null;
                            }
                            return "Enter flat, House no, building";
                          }),
                      CustomTextField(
                          validator: (value) {
                            if (value!.length > 5) {
                              return null;
                            }
                            return "Enter Area, Sreetl";
                          },
                          controller: _areaController,
                          hintText: "Area, Sreet"),
                      CustomTextField(
                          validator: (value) {
                            if (value!.length > 5) {
                              return null;
                            }
                            return "Enter pincode";
                          },
                          controller: _pinController,
                          hintText: "Pincode"),
                      CustomTextField(
                          validator: (value) {
                            if (value!.length > 5) {
                              return null;
                            }
                            return "Enter Town, city`";
                          },
                          controller: _cityController,
                          hintText: "Town, city"),
                      const SizedBox(
                        height: 10,
                      ),
                      // FutureBuilder<PaymentConfiguration>(
                      //     future: _googlePayConfigFuture,
                      //     builder: (context, snapshot) => snapshot.hasData
                      //         ? GooglePayButton(
                      //             paymentConfiguration: snapshot.data!,
                      //             paymentItems: payItem,
                      //             type: GooglePayButtonType.buy,
                      //             margin: const EdgeInsets.only(top: 15.0),
                      //             onPaymentResult: onGooglePayResult,
                      //             loadingIndicator: const Center(
                      //               child: CircularProgressIndicator(),
                      //             ),
                      //           )
                      //         : const SizedBox.shrink()),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
