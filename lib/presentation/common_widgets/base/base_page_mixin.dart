import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../shared/exceptions/app_exception_wrapper.dart';

mixin BasePageMixin {
  Widget buildPage(BuildContext context);

  void handleException(AppExceptionWrapper appExceptionWrapper) {
    final String? errorMsg = appExceptionWrapper.appException.message;
    if (errorMsg != null) {
      showMessage(errorMsg);
    }
  }

  void showMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }
}
