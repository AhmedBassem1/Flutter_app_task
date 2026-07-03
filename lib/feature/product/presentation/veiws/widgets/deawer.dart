import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_task/core/theme/theme_cubit/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Deawer extends StatefulWidget {
  const Deawer({
    super.key,
  });

  @override
  State<Deawer> createState() => _DeawerState();
}

class _DeawerState extends State<Deawer> {
  void changeLanguage() {
   if (context.locale == Locale('en', 'US')) {
    context.setLocale(Locale('ar', 'SA'));
    } else {
      context.setLocale(Locale('en', 'US'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  final isDark = state.themeData.brightness == Brightness.dark;
                  
                  return ListTile(
                    title: Text(isDark ? "dark_mode".tr() : "light_mode".tr(),),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<ThemeCubit>().toggleTheme();
                      },
                      icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              ListTile(
                title: Text("language".tr()),
                trailing: IconButton(
                  onPressed: changeLanguage,
                  icon: const Icon(Icons.language),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
