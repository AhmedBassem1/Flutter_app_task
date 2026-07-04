import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_task/core/theme/theme_cubit/theme_cubit.dart';
import 'package:flutter_app_task/core/utlis/api_service.dart';
import 'package:flutter_app_task/feature/product/data/repo/product_repo_impl.dart';
import 'package:flutter_app_task/feature/product/presentation/manager/cubit/product_cubit.dart';
import 'package:flutter_app_task/feature/product/presentation/veiws/products_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'SA')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en', 'US'),
      child:  DevicePreview(
    enabled: true, // Set to false to disable device preview
    builder: (context) => MyApp(), // Wrap your app
  ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ProductCubit(ProductRepoImpl(ApiService(Dio())))..getProducts(),
        ),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (BuildContext context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: state.themeData,
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            home: const ProductsView(),
          );
        },
      ),
    );
  }
}
