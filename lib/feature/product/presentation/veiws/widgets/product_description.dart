import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Product Description',
      style: TextStyle(
        fontSize: 16,
        color: Color(0xff3C2F2F),
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
