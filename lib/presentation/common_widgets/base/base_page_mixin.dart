import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../shared/exceptions/app_exception.dart';

mixin class BasePageMixin {
  void handleException(AppException exception) {
    final String? errorMsg = exception.message;
    if (errorMsg != null) {
      Fluttertoast.showToast(msg: errorMsg);
    }
  }

  Widget buildPage(BuildContext context) => const SizedBox();
}
