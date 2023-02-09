import 'package:flutter/material.dart';

class LoaderButton extends StatelessWidget {
  const LoaderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
