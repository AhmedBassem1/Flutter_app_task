import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app_task/core/errors/failure.dart';
import 'package:flutter_app_task/core/utlis/api_service.dart';
import 'package:flutter_app_task/feature/product/data/models/product_model/product.dart';
import 'package:flutter_app_task/feature/product/data/repo/product_repo.dart';

class ProductRepoImpl implements ProductsRepo {
  final ApiService apiService;
  ProductRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final response = await apiService.get(endPoint: 'products');

    final products = (response['products'] as List)
        .map((e) => Product.fromJson(e))
        .toList();
      return Right(products);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}