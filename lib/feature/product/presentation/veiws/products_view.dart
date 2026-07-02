import 'package:flutter/material.dart';
import 'package:flutter_app_task/core/theme/theme_cubit/theme_cubit.dart';
import 'package:flutter_app_task/feature/product/presentation/veiws/widgets/products_veiw_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                final isDark = state.themeData.brightness == Brightness.dark;

                return ListTile(
                  title: Text(isDark ? 'Dark Mode' : 'Light Mode'),
                  trailing: IconButton(
                    onPressed: () {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                    icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          'Products',
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
