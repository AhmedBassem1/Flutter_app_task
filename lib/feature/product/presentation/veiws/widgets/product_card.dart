import 'package:flutter/material.dart';
import 'package:flutter_app_task/feature/product/data/models/product_model/product.dart';
import 'package:flutter_app_task/feature/product/presentation/veiws/product_details_view.dart';
import 'package:flutter_app_task/feature/product/presentation/veiws/widgets/product_card_details.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsView(product: product),
          ),
        );
      },
      child: Container(
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
        child: ProductCardDetails(product: product,),
      ),
    );
  }
}
