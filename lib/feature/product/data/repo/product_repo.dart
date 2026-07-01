import 'package:dartz/dartz.dart';
import 'package:flutter_app_task/core/errors/failure.dart';
import 'package:flutter_app_task/core/utlis/api_service.dart';
import 'package:flutter_app_task/feature/product/data/models/product_model/product.dart';

abstract class ProductsRepo {
  ProductsRepo(ApiService apiService);

 Future<Either<Failure, List<Product>>> getProducts();}