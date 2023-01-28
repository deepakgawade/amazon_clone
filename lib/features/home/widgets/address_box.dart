import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 114, 226, 221),
          Color.fromARGB(255, 162, 236, 233)
        ], stops: [
          0.5,
          1.0
        ]),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Icon(
              Icons.location_on_outlined,
              size: 20,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
                'Delivery to ${user.fullName} - ${user.address}', //101 Fake Mall, Kanchipuram, kerala, india 403450',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis),
          )),
          const Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }
}
