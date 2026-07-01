import 'package:flutter_app_task/feature/product/data/models/product_model/product.dart';

abstract class ProductState {}
class ProductInitialState extends ProductState {}
class ProductLoadingState extends ProductState {}   
class ProductFailureState extends ProductState {
  final String errorMessage;
  ProductFailureState(this.errorMessage);
}
class ProductSuccessState extends ProductState {
  final List<Product> products;
  ProductSuccessState(this.products);
}