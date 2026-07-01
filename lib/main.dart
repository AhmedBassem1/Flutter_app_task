import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_task/core/utlis/api_service.dart';
import 'package:flutter_app_task/feature/product/data/repo/product_repo_impl.dart';
import 'package:flutter_app_task/feature/product/presentation/manager/cubit/product_cubit.dart';
import 'package:flutter_app_task/feature/product/presentation/veiws/product_details_view.dart';
import 'package:flutter_app_task/feature/product/presentation/veiws/products_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit(ProductRepoImpl(ApiService(Dio())))..getProducts(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const ProductsView(),
      ),
    );
  }
}
