import 'package:flutter/material.dart';
import 'package:flutter_app_task/feature/product/data/models/product_model/product.dart';
import 'package:flutter_app_task/feature/product/presentation/veiws/widgets/product_description.dart';
import 'package:flutter_app_task/feature/product/presentation/veiws/widgets/product_image.dart';
import 'package:flutter_app_task/feature/product/presentation/veiws/widgets/product_name.dart';
import 'package:flutter_app_task/feature/product/presentation/veiws/widgets/product_price.dart';
import 'package:flutter_app_task/feature/product/presentation/veiws/widgets/product_rating.dart';

class ProductsDetailsViewBody extends StatelessWidget {
  const ProductsDetailsViewBody({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImage(product: product),
          const SizedBox(height: 8),
          ProductName(product: product),
          const SizedBox(height: 8),
          ProductDescription(product: product),
          const SizedBox(height: 8),
          ProductPrice(product: product),
          const SizedBox(height: 8),
          ProductRating(product: product),
        ],
      ),
    );
  }
}
