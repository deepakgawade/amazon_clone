import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {required this.onPressed,
      required this.text,
      Key? key,
      this.color,
      this.textColor})
      : super(key: key);
  final String text;
  final void Function() onPressed;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
