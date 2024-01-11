import 'dart:async';

import '../../l10n/generated/l10n.dart';
import 'app_exception.dart';

/// The [AppExceptionWrapper], which only use in presentation layer
class AppExceptionWrapper {
  final AppException appException;
  final String commonExceptionMessage;
  final String? overrideMessage;
  final ExceptionDisplayStyle? displayStyle;
  final FutureOr<void> Function()? onRetry;

  AppExceptionWrapper(
    this.appException, {
    String? commonExceptionMessage,
    this.overrideMessage,
    this.displayStyle = ExceptionDisplayStyle.toast,
    this.onRetry,
  }) : commonExceptionMessage =
            commonExceptionMessage ?? L.current.lbl_common_exception_message;

  String get errorMessageDisplayed {
    return overrideMessage ?? appException.message ?? commonExceptionMessage;
  }
}

enum ExceptionDisplayStyle {
  toast,
  dialog,
}
