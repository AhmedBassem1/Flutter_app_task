import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_task/feature/product/data/models/product_model/product.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key,  required this.product, });
 final Product product;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
            imageUrl: product.thumbnail!,
            height: 400,
            width: double.infinity,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          );
  }
}
