import 'package:flutter/material.dart';

import '../../app/navigation/app_navigator.dart';
import '../../l10n/generated/l10n.dart';
import '../../presentation/common_widgets/dialog/custom_dialog.dart';
import '../../presentation/common_widgets/dialog/error_dialog.dart';
import '../../presentation/common_widgets/dialog/info_dialog.dart';
import '../resources/resources.dart';

class DialogUtils {
  DialogUtils._();

  static int dialogNumberShown = 0;

  static Future<void> showCustomDialog({
    String? title,
    required Widget content,
    required String positiveButtonText,
    required VoidCallback onPositiveButtonTap,
    TextStyle? positiveButtonTextStyle,
    String? negativeButtonText,
    VoidCallback? onNegativeButtonTap,
    TextStyle? negativeButtonTextStyle,
  }) async {
    final BuildContext currentContext = AppNavigator.context;

    if (dialogNumberShown > 0) {
      dialogNumberShown--;
      AppNavigator.pop();
    }

    dialogNumberShown++;
    await showDialog(
      context: currentContext,
      builder: (context) {
        return CustomDialog(
          content: content,
          title: title,
          positiveButtonText: positiveButtonText,
          onPositiveButtonTap: onPositiveButtonTap,
          positiveButtonTextStyle: positiveButtonTextStyle,
          negativeButtonText: negativeButtonText,
          negativeButtonTextStyle: negativeButtonTextStyle,
          onNegativeButtonTap: onNegativeButtonTap,
        );
      },
    );
    dialogNumberShown--;
  }

  static Future<void> showErrorDialog({
    String? title,
    required String message,
    VoidCallback? onRetryButtonTap,
    String? closeButtonText,
    VoidCallback? onCloseButtonTap,
  }) async {
    final BuildContext currentContext = AppNavigator.context;

    if (dialogNumberShown > 0) {
      dialogNumberShown--;
      AppNavigator.pop();
    }

    dialogNumberShown++;
    await showDialog(
      context: currentContext,
      builder: (context) {
        return ErrorDialog(
          title: title,
          message: message,
          onRetryButtonTap: onRetryButtonTap == null
              ? null
              : () {
                  onRetryButtonTap.call();
                  Navigator.pop(context);
                },
          onCloseButtonTap: () {
            onCloseButtonTap?.call();
            Navigator.pop(context);
          },
        );
      },
    );
    dialogNumberShown--;
  }

  static Future<void> showInfoDialog({
    String? title,
    Widget? content,
    String? message,
    String? buttonTitle,
    VoidCallback? onButtonTap,
  }) async {
    final BuildContext currentContext = AppNavigator.context;

    if (dialogNumberShown > 0) {
      dialogNumberShown--;
      AppNavigator.pop();
    }

    dialogNumberShown++;
    await showDialog(
      context: currentContext,
      builder: (context) {
        return InfoDialog(
          title: title,
          content: content,
          message: message,
          buttonTitle: buttonTitle,
          onButtonTap: () {
            onButtonTap?.call();
            Navigator.pop(context);
          },
        );
      },
    );
    dialogNumberShown--;
  }

  static Future<void> showConfirmationDialog({
    String? title,
    String? message,
    required String confirmationButtonTitle,
    required VoidCallback onConfirmationButtonTap,
    Color? confirmationButtonTitleColor,
    String? cancelButtonTitle,
    VoidCallback? onCancelButtonTap,
    Color? cancelButtonTitleColor,
  }) async {
    final BuildContext currentContext = AppNavigator.context;

    if (dialogNumberShown > 0) {
      dialogNumberShown--;
      AppNavigator.pop();
    }

    dialogNumberShown++;
    await showDialog(
      context: currentContext,
      builder: (context) {
        return CustomDialog(
          title: title,
          content: message != null
              ? Text(
                  message,
                  style: AppTextStyles.robotoLight16.copyWith(
                    color: context.colors.onBackground,
                  ),
                  textAlign: TextAlign.center,
                )
              : null,
          positiveButtonText: confirmationButtonTitle,
          onPositiveButtonTap: () {
            onConfirmationButtonTap.call();
            Navigator.pop(context);
          },
          positiveButtonTextStyle: AppTextStyles.robotoSemiBold16.copyWith(
            color: confirmationButtonTitleColor ?? context.colors.red500,
          ),
          negativeButtonText: cancelButtonTitle ?? L.current.lbl_cancel,
          onNegativeButtonTap: () {
            onCancelButtonTap?.call();
            Navigator.pop(context);
          },
          negativeButtonTextStyle: AppTextStyles.robotoRegular16.copyWith(
            color: cancelButtonTitleColor ?? context.colors.primary,
          ),
        );
      },
    );
    dialogNumberShown--;
  }
}
