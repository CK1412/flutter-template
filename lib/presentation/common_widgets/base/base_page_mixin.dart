import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../shared/exceptions/app_exception.dart';

mixin BasePageMixin {
  Widget buildPage(BuildContext context);

  void handleException(AppException exception) {
    final String? errorMsg = exception.message;
    if (errorMsg != null) {
      Fluttertoast.showToast(msg: errorMsg);
    }
  }
}
