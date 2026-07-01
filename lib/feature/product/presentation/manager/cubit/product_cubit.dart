import 'package:flutter_app_task/feature/product/data/repo/product_repo.dart';
import 'package:flutter_app_task/feature/product/presentation/manager/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepo) : super(ProductInitialState());

  final ProductsRepo productRepo;

  Future<void> getProducts() async {
    emit(ProductLoadingState());
    final result = await productRepo.getProducts();
    result.fold(
      (failure) => emit(ProductFailureState(failure.errMessage)),
      (products) => emit(ProductSuccessState(products)),
    );
  }
}
