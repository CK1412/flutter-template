import 'package:flutter/material.dart';

import '../../../shared/exceptions/app_exception_wrapper.dart';
import '../../../shared/utils/dialog_utils.dart';
import '../../../shared/utils/toast_utils.dart';

mixin BasePageMixin {
  Widget buildPage(BuildContext context);

  void handleException(AppExceptionWrapper appExceptionWrapper) {
    final String messageDisplayed = appExceptionWrapper.errorMessageDisplayed;

    switch (appExceptionWrapper.displayStyle) {
      case ExceptionDisplayStyle.toast:
        showToast(messageDisplayed);
      case ExceptionDisplayStyle.dialog:
        DialogUtils.showErrorDialog(
          message: messageDisplayed,
          onRetryButtonTap: appExceptionWrapper.onRetry,
        );
      default:
        return;
    }
  }

  void showToast(String message) {
    ToastUtils.showMessage(message);
  }
}
