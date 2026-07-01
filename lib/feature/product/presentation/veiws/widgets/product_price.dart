import 'package:flutter/material.dart';
import 'package:flutter_app_task/feature/product/data/models/product_model/product.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({super.key, required this.product, });
 final Product product;

  @override
  Widget build(BuildContext context) {
    return  Text(
      '${product.price}',
      style: TextStyle(
        fontSize: 16,
        color: Color(0xff3C2F2F),
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
