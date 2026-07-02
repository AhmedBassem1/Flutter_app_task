import 'package:flutter/material.dart';
import 'package:flutter_app_task/core/widgets/custom_error_widget.dart';
import 'package:flutter_app_task/feature/product/presentation/manager/cubit/product_cubit.dart';
import 'package:flutter_app_task/feature/product/presentation/manager/cubit/product_state.dart';
import 'package:flutter_app_task/feature/product/presentation/veiws/widgets/product_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsVeiwBody extends StatelessWidget {
  const ProductsVeiwBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: ( context, state) {
        if (state is ProductLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductSuccessState) {
          return RefreshIndicator(
            onRefresh: () { 
              return context.read<ProductCubit>().getProducts();
            },
            child: GridView.builder(
              itemCount: state.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ProductCard(product: state.products[index],);
              },
            ),
          );
        } else if (state is ProductFailureState) {
          return Center(
            child: CustomErrorWidget(errMessage: state.errorMessage),
          );
        }
        return const SizedBox();
      },
    );
  }
}
