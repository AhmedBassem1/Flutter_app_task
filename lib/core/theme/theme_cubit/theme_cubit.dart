import 'package:flutter/material.dart';
import 'package:flutter_app_task/core/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial(lightMode));

  void toggleTheme() {
    if (state.themeData == lightMode) {
      emit(ThemeInitial(darkMode));
    } else {
      emit(ThemeInitial(lightMode));
    }
  }
}