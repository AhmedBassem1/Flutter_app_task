import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Image.asset('assets/images/images.jpeg'),
    );
  }
}
