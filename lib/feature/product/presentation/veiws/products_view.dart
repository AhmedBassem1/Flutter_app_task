import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_task/feature/product/presentation/veiws/widgets/deawer.dart';
import 'package:flutter_app_task/feature/product/presentation/veiws/widgets/products_veiw_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Deawer(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          'products'.tr(),
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: ProductsVeiwBody(),
      ),
    );
  }
}

