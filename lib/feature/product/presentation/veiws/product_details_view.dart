import 'package:flutter/material.dart';
import 'package:flutter_app_task/feature/product/presentation/veiws/widgets/products_details_view_body.dart';


class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffCEA968),
        title: const Text(
          'Products',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: const ProductsDetailsViewBody(),
    );
  }
}
