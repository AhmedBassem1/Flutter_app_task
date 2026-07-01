import 'package:flutter/material.dart';
import 'package:flutter_app_task/feature/product/presentation/veiws/widgets/products_veiw_body.dart';



class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

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
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: ProductsVeiwBody(),
      ),
    );
  }
}
