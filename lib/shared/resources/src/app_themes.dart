import 'package:flutter/material.dart';

import '../../../app/navigation/transitions/no_transitions_on_web.dart';
import 'app_colors.dart';

class AppThemes {
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.light.primary,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 0,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: AppColors.light.primary,
      ),
      pageTransitionsTheme: NoTransitionsOnWeb(),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.dark.primary,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 0,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: AppColors.dark.primary,
      ),
      pageTransitionsTheme: NoTransitionsOnWeb(),
    );
  }
}
