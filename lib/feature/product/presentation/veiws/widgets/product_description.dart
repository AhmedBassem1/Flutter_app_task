import 'package:flutter/material.dart';
import 'package:flutter_app_task/feature/product/data/models/product_model/product.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key, required Product product});
 
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
