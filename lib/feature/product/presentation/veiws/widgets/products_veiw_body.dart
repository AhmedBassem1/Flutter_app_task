import 'package:flutter/material.dart';
import 'package:flutter_app_task/feature/product/presentation/veiws/widgets/product_card.dart';


class ProductsVeiwBody extends StatelessWidget {
  const ProductsVeiwBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (BuildContext context, int index) {
        return const ProductCard();
      },
    );
  }
}
