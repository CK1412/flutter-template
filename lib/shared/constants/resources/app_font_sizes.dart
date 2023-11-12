import 'dart:ui';

import 'package:flutter/material.dart';

enum AppFontSizes {
  fontSize8(8),
  fontSize10(10),
  fontSize12(12),
  fontSize14(14),
  fontSize15(15),
  fontSize16(16),
  fontSize18(18),
  fontSize20(20),
  fontSize22(22),
  fontSize24(24),
  fontSize28(28),
  fontSize32(32),
  fontSize36(36);

  final double value;

  const AppFontSizes(this.value);
}

extension AppFontSizesExtension on AppFontSizes {
  /// [screenWidthOfDesign] The width of the screen on design (e.g. Figma, AdobeXD, ...)
  double getRelativeFontSize() {
    final FlutterView view =
        WidgetsBinding.instance.platformDispatcher.views.first;
    final double viewWidth = MediaQueryData.fromView(view).size.width;
    // TODO(developer): update `screenWidthOfDesign` according to your design.
    const double screenWidthOfDesign = 360;
    final double scaleFactor = viewWidth / screenWidthOfDesign;
    return value * (scaleFactor >= 1 ? 1 : scaleFactor);
  }
}
