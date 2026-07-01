import 'package:flutter/material.dart';
import 'package:flutter_app_task/feature/product/data/models/product_model/product.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({super.key, required this.product, });
 final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star_rate_rounded),
        const SizedBox(width: 3),
        Text(
          '${product.rating!}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
