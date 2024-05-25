import 'dart:ui';

import 'package:flutter/material.dart';

enum AppFontSizes {
  fontSize8(8),
  fontSize10(10),
  fontSize12(12),
  fontSize13(13),
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
  /// Reduce font size for screens whose width is smaller than the screen width size on the design.
  double getRelativeFontSize() {
    final FlutterView view =
        WidgetsBinding.instance.platformDispatcher.views.first;
    final double viewWidth = MediaQueryData.fromView(view).size.width;

    /// [screenWidthOfDesign] The width of the screen on design (e.g. Figma, AdobeXD, ...)
    // TODO(developer): update `screenWidthOfDesign` according to your design.
    const double screenWidthOfDesign = 360;
    final double scaleFactor = viewWidth / screenWidthOfDesign;
    return value * (scaleFactor >= 1 ? 1 : scaleFactor);
  }

  /// Get height of text style from line height in Figma
  double? getHeightFromFigma({int? pixels, int? percentOfFontSize}) {
    assert(
      (pixels == null && percentOfFontSize != null) ||
          (pixels != null && percentOfFontSize == null),
      'Cannot provide both a pixels and a percentOfFontSize',
    );

    if (pixels != null) {
      return pixels / value;
    }
    if (percentOfFontSize != null) {
      return percentOfFontSize / 100;
    }

    return null;
  }
}
