import 'package:flutter/material.dart';
import 'package:flutter_app_task/feature/product/presentation/veiws/widgets/product_description.dart';
import 'package:flutter_app_task/feature/product/presentation/veiws/widgets/product_image.dart';
import 'package:flutter_app_task/feature/product/presentation/veiws/widgets/product_name.dart';
import 'package:flutter_app_task/feature/product/presentation/veiws/widgets/product_price.dart';
import 'package:flutter_app_task/feature/product/presentation/veiws/widgets/product_rating.dart';



class ProductsDetailsViewBody extends StatelessWidget {
  const ProductsDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProductImage(),
          const SizedBox(height: 8),
          const ProductName(),
          const SizedBox(height: 8),
          const ProductDescription(),
          const SizedBox(height: 8),
          const ProductPrice(),
          const SizedBox(height: 8),
          const ProductRating(),
        ],
      ),
    );
  }
}
