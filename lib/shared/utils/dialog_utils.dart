import 'package:flutter/material.dart';

import '../../app/navigation/app_navigator.dart';
import '../../presentation/common_widgets/dialog/custom_dialog.dart';
import '../../presentation/common_widgets/dialog/error_dialog.dart';

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
      AppNavigator.popIfPossible();
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
      AppNavigator.popIfPossible();
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
}
