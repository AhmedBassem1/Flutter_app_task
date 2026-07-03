import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_task/feature/product/data/models/product_model/product.dart';
import 'package:flutter_app_task/feature/product/presentation/veiws/widgets/products_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffCEA968),
        title:  Text(
          "product_details".tr(),
          style: Theme.of(context).appBarTheme.titleTextStyle,

        ),
      ),
      body: ProductsDetailsViewBody(product: product),
    );
  }
}
