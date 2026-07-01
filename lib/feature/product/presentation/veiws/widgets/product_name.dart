import 'package:flutter/material.dart';

class ProductName extends StatelessWidget {
  const ProductName({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Product Name',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
    );
  }
}
