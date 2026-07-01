import 'package:flutter/material.dart';
import 'package:flutter_app_task/feature/product/data/models/product_model/product_model.dart';
import 'package:flutter_app_task/feature/product/presentation/veiws/widgets/product_card_details.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 0,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: ProductCardDetails(),
    );
  }
}
