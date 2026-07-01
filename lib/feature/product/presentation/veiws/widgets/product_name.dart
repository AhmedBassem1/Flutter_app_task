import 'package:flutter/material.dart';
import 'package:flutter_app_task/feature/product/data/models/product_model/product.dart';

class ProductName extends StatelessWidget {
  const ProductName({super.key, required this.product, });
 final Product product;

  @override
  Widget build(BuildContext context) {
    return  Text(
      product.title!,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
    );
  }
}
