import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        height: 5.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
          border: Border.all(color: Colors.white, width: 0),
        ),
        child: OutlinedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            backgroundColor: Colors.black.withOpacity(0.03),
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
