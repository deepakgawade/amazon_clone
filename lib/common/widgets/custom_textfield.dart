import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {required this.controller,
      required this.hintText,
      Key? key,
      this.validator,
      this.isObscure = false,
      this.maxlines = 1})
      : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool isObscure;
  final int? maxlines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        maxLines: maxlines,
        obscureText: isObscure,
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Enter your $hintText';
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black26,
          )),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black26,
          )),
        ),
      ),
    );
  }
}
