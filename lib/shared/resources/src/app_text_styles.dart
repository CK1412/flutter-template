import 'package:flutter/material.dart';

import '../../../../gen/fonts.gen.dart';
import 'app_font_sizes.dart';

class AppTextStyles {
  AppTextStyles._();

  static const int commonPercentOfFontSizeFigma = 120;

  /// Roboto - w300 - fontSize10
  static final TextStyle robotoLight10 = TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w300,
    fontSize: AppFontSizes.fontSize10.getRelativeFontSize(),
    height: AppFontSizes.fontSize10.getHeightFromFigma(
      percentOfFontSize: commonPercentOfFontSizeFigma,
    ),
  );

  /// Roboto - w300 - fontSize12
  static final TextStyle robotoLight12 = TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w300,
    fontSize: AppFontSizes.fontSize12.getRelativeFontSize(),
    height: AppFontSizes.fontSize12.getHeightFromFigma(
      percentOfFontSize: commonPercentOfFontSizeFigma,
    ),
  );

  /// Roboto - w300 - fontSize14
  static final TextStyle robotoLight14 = TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w300,
    fontSize: AppFontSizes.fontSize14.getRelativeFontSize(),
    height: AppFontSizes.fontSize14.getHeightFromFigma(
      percentOfFontSize: commonPercentOfFontSizeFigma,
    ),
  );

  /// Roboto - w300 - fontSize16
  static final TextStyle robotoLight16 = TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w300,
    fontSize: AppFontSizes.fontSize16.getRelativeFontSize(),
    height: AppFontSizes.fontSize16.getHeightFromFigma(
      percentOfFontSize: commonPercentOfFontSizeFigma,
    ),
  );

  /// Roboto - w400 - fontSize10
  static final TextStyle robotoRegular10 = TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w400,
    fontSize: AppFontSizes.fontSize10.getRelativeFontSize(),
    height: AppFontSizes.fontSize10.getHeightFromFigma(
      percentOfFontSize: commonPercentOfFontSizeFigma,
    ),
  );

  /// Roboto - w400 - fontSize12
  static final TextStyle robotoRegular12 = TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w400,
    fontSize: AppFontSizes.fontSize12.getRelativeFontSize(),
    height: AppFontSizes.fontSize12.getHeightFromFigma(
      percentOfFontSize: commonPercentOfFontSizeFigma,
    ),
  );

  /// Roboto - w400 - fontSize14
  static final TextStyle robotoRegular14 = TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w400,
    fontSize: AppFontSizes.fontSize14.getRelativeFontSize(),
    height: AppFontSizes.fontSize14.getHeightFromFigma(
      percentOfFontSize: commonPercentOfFontSizeFigma,
    ),
  );

  /// Roboto - w400 - fontSize16
  static final TextStyle robotoRegular16 = TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w400,
    fontSize: AppFontSizes.fontSize16.getRelativeFontSize(),
    height: AppFontSizes.fontSize16.getHeightFromFigma(
      percentOfFontSize: commonPercentOfFontSizeFigma,
    ),
  );

  /// Roboto - w400 - fontSize24
  static final TextStyle robotoRegular24 = TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w400,
    fontSize: AppFontSizes.fontSize24.getRelativeFontSize(),
    height: AppFontSizes.fontSize24.getHeightFromFigma(
      percentOfFontSize: commonPercentOfFontSizeFigma,
    ),
  );

  /// Roboto - w500 - fontSize14
  static final TextStyle robotoMedium14 = TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w500,
    fontSize: AppFontSizes.fontSize14.getRelativeFontSize(),
    height: AppFontSizes.fontSize14.getHeightFromFigma(
      percentOfFontSize: commonPercentOfFontSizeFigma,
    ),
  );

  /// Roboto - w500 - fontSize16
  static final TextStyle robotoMedium16 = TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w500,
    fontSize: AppFontSizes.fontSize16.getRelativeFontSize(),
    height: AppFontSizes.fontSize16.getHeightFromFigma(
      percentOfFontSize: commonPercentOfFontSizeFigma,
    ),
  );

  /// Roboto - w500 - fontSize18
  static final TextStyle robotoMedium18 = TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w500,
    fontSize: AppFontSizes.fontSize18.getRelativeFontSize(),
    height: AppFontSizes.fontSize18.getHeightFromFigma(
      percentOfFontSize: commonPercentOfFontSizeFigma,
    ),
  );

  /// Roboto - w500 - fontSize24
  static final TextStyle robotoMedium24 = TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w500,
    fontSize: AppFontSizes.fontSize24.getRelativeFontSize(),
    height: AppFontSizes.fontSize24.getHeightFromFigma(
      percentOfFontSize: commonPercentOfFontSizeFigma,
    ),
  );

  /// Roboto - w600 - fontSize14
  static final TextStyle robotoSemiBold14 = TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w600,
    fontSize: AppFontSizes.fontSize14.getRelativeFontSize(),
    height: AppFontSizes.fontSize14.getHeightFromFigma(
      percentOfFontSize: commonPercentOfFontSizeFigma,
    ),
  );

  /// Roboto - w600 - fontSize16
  static final TextStyle robotoSemiBold16 = TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w600,
    fontSize: AppFontSizes.fontSize16.getRelativeFontSize(),
    height: AppFontSizes.fontSize16.getHeightFromFigma(
      percentOfFontSize: commonPercentOfFontSizeFigma,
    ),
  );

  /// Roboto - w600 - fontSize18
  static final TextStyle robotoSemiBold18 = TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w600,
    fontSize: AppFontSizes.fontSize18.getRelativeFontSize(),
    height: AppFontSizes.fontSize18.getHeightFromFigma(
      percentOfFontSize: commonPercentOfFontSizeFigma,
    ),
  );

  /// Roboto - w600 - fontSize24
  static final TextStyle robotoSemiBold24 = TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w600,
    fontSize: AppFontSizes.fontSize24.getRelativeFontSize(),
    height: AppFontSizes.fontSize24.getHeightFromFigma(
      percentOfFontSize: commonPercentOfFontSizeFigma,
    ),
  );

  /// Roboto - w700 - fontSize14
  static final TextStyle robotoBold14 = TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w700,
    fontSize: AppFontSizes.fontSize14.getRelativeFontSize(),
    height: AppFontSizes.fontSize14.getHeightFromFigma(
      percentOfFontSize: commonPercentOfFontSizeFigma,
    ),
  );

  /// Roboto - w700 - fontSize16
  static final TextStyle robotoBold16 = TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w700,
    fontSize: AppFontSizes.fontSize16.getRelativeFontSize(),
    height: AppFontSizes.fontSize16.getHeightFromFigma(
      percentOfFontSize: commonPercentOfFontSizeFigma,
    ),
  );

  /// Roboto - w700 - fontSize18
  static final TextStyle robotoBold18 = TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w700,
    fontSize: AppFontSizes.fontSize18.getRelativeFontSize(),
    height: AppFontSizes.fontSize18.getHeightFromFigma(
      percentOfFontSize: commonPercentOfFontSizeFigma,
    ),
  );

  /// Roboto - w700 - fontSize24
  static final TextStyle robotoBold24 = TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w700,
    fontSize: AppFontSizes.fontSize24.getRelativeFontSize(),
    height: AppFontSizes.fontSize24.getHeightFromFigma(
      percentOfFontSize: commonPercentOfFontSizeFigma,
    ),
  );
}
