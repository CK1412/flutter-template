import 'package:flutter/material.dart';

/// The [AppColors], which defines the colors used in the application.
/// This color system follows the Material Design style.
///
/// See also:
/// * <https://m3.material.io/styles/color/system/overview>
/// * ColorScheme: https://flutter.github.io/samples/web/material_3_demo/
class AppColors {
  late final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;

  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;

  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;

  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;

  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color surfaceTint;

  final Color outline;
  final Color outlineVariant;

  final Color inverseSurface;
  final Color onInverseSurface;
  final Color inversePrimary;

  final Color background;
  final Color onBackground;
  final Color scrim;
  final Color shadow;

  AppColors({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.surfaceTint,
    required this.outline,
    required this.outlineVariant,
    required this.inverseSurface,
    required this.onInverseSurface,
    required this.inversePrimary,
    required this.background,
    required this.onBackground,
    required this.scrim,
    required this.shadow,
  });

  static final AppColors light = AppColors(
    primary: const Color(0xFF006492),
    onPrimary: const Color(0xFFFFFFFF),
    primaryContainer: const Color(0xFFC9E6FF),
    onPrimaryContainer: const Color(0xFF001E2F),
    secondary: const Color(0xFF50606E),
    onSecondary: const Color(0xFFFFFFFF),
    secondaryContainer: const Color(0xFFD3E5F5),
    onSecondaryContainer: const Color(0xFF0C1D29),
    tertiary: const Color(0xFF64597B),
    onTertiary: const Color(0xFFFFFFFF),
    tertiaryContainer: const Color(0xFFEADDFF),
    onTertiaryContainer: const Color(0xFF201635),
    error: const Color(0xFFBA1A1A),
    onError: const Color(0xFFFFFFFF),
    errorContainer: const Color(0xFFFFDAD6),
    onErrorContainer: const Color(0xFF410002),
    surface: const Color(0xFFFCFCFF),
    onSurface: const Color(0xFF1A1C1E),
    surfaceVariant: const Color(0xFFDDE3EA),
    onSurfaceVariant: const Color(0xFF41474D),
    surfaceTint: const Color(0xFF006492),
    outline: const Color(0xFF72787E),
    outlineVariant: const Color(0xFFC1C7CE),
    inverseSurface: const Color(0xFF2E3133),
    onInverseSurface: const Color(0xFFF0F0F3),
    inversePrimary: const Color(0xFF8ACEFF),
    background: const Color(0xFFFCFCFF),
    onBackground: const Color(0xFF1A1C1E),
    scrim: const Color(0xFF000000),
    shadow: const Color(0xFF000000),
  );

  static final AppColors dark = AppColors(
    primary: const Color(0xFF8ACEFF),
    onPrimary: const Color(0xFF00344E),
    primaryContainer: const Color(0xFF004B6F),
    onPrimaryContainer: const Color(0xFFC9E6FF),
    secondary: const Color(0xFFB7C9D9),
    onSecondary: const Color(0xFF22323F),
    secondaryContainer: const Color(0xFF384956),
    onSecondaryContainer: const Color(0xFFD3E5F5),
    tertiary: const Color(0xFFCEC0E8),
    onTertiary: const Color(0xFF352B4B),
    tertiaryContainer: const Color(0xFF4C4162),
    onTertiaryContainer: const Color(0xFFEADDFF),
    error: const Color(0xFFFFB4AB),
    onError: const Color(0xFF690005),
    errorContainer: const Color(0xFF93000A),
    onErrorContainer: const Color(0xFFFFB4AB),
    surface: const Color(0xFF1A1C1E),
    onSurface: const Color(0xFFE2E2E5),
    surfaceVariant: const Color(0xFF41474D),
    onSurfaceVariant: const Color(0xFFC1C7CE),
    surfaceTint: const Color(0xFF8ACEFF),
    outline: const Color(0xFF8B9198),
    outlineVariant: const Color(0xFF41474D),
    inverseSurface: const Color(0xFFE2E2E5),
    onInverseSurface: const Color(0xFF2E3133),
    inversePrimary: const Color(0xFF006492),
    background: const Color(0xFF1A1C1E),
    onBackground: const Color(0xFFE2E2E5),
    scrim: const Color(0xFF000000),
    shadow: const Color(0xFF000000),
  );
}

extension AppColorsExtension on BuildContext {
  AppColors get colors {
    return _colorsFromBrightness(Theme.of(this).brightness);
  }

  AppColors _colorsFromBrightness(Brightness brightness) {
    switch (brightness) {
      case Brightness.light:
        return AppColors.light;
      case Brightness.dark:
        return AppColors.light;
    }
  }
}
