import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      r'$ 99.9',
      style: TextStyle(
        fontSize: 16,
        color: Color(0xff3C2F2F),
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
