import 'package:flutter/material.dart';

import '../../app/navigation/app_navigator.dart';
import '../../presentation/common_widgets/dialog/custom_dialog.dart';

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
  }
}
