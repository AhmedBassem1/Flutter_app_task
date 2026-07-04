import 'package:flutter/material.dart';
import 'package:flutter_app_task/core/widgets/custom_error_widget.dart';
import 'package:flutter_app_task/feature/product/presentation/manager/cubit/product_cubit.dart';
import 'package:flutter_app_task/feature/product/presentation/manager/cubit/product_state.dart';
import 'package:flutter_app_task/feature/product/presentation/veiws/widgets/product_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsVeiwBody extends StatefulWidget {
  const ProductsVeiwBody({super.key});

  @override
  State<ProductsVeiwBody> createState() => _ProductsVeiwBodyState();
}

class _ProductsVeiwBodyState extends State<ProductsVeiwBody> {
  bool isLoadingMore = false;
  int _loadedItemsCount = 10;

  @override
  void initState() {
    super.initState();
  }

  void _loadMoreData() {
    if (isLoadingMore) return;

    setState(() {
      isLoadingMore = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _loadedItemsCount += 10;
        isLoadingMore = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductSuccessState) {
          return RefreshIndicator(
            onRefresh: () {
              return context.read<ProductCubit>().getProducts();
            },
            child: NotificationListener(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo is ScrollEndNotification) {
                  final maxScroll = scrollInfo.metrics.maxScrollExtent;
                  final currentScroll = scrollInfo.metrics.pixels;
                  final triggerFetchMore = maxScroll * 0.9;

                  print('maxScroll: $maxScroll');
                  print('currentScroll: $currentScroll');
                  print('triggerFetchMore: $triggerFetchMore');
                  if (currentScroll >= triggerFetchMore) {
                    print('load more data');
                    _loadMoreData();
                  }
                }
                return false;
              },
              child: GridView.builder(
                itemCount:
                    (_loadedItemsCount > state.products.length
                        ? state.products.length
                        : _loadedItemsCount) +
                    (isLoadingMore ? 1 : 0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (BuildContext context, int index) {
                  if (index < _loadedItemsCount.clamp(0, state.products.length)) {
                    return ProductCard(product: state.products[index]);
                  } else {
                    return Center(
                      child: const CircularProgressIndicator()
                    );
                  }
                },
              ),
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
