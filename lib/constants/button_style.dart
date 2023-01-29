import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  ///onPrimary: Colors.black87,
  primary: GlobalVariables.secondaryColor,
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);
