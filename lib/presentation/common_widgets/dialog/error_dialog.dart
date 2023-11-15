import 'package:flutter/material.dart';

import '../../../l10n/generated/l10n.dart';
import '../../../shared/resources/resources.dart';
import 'custom_dialog.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    super.key,
    this.title,
    required this.message,
    required this.onRetryButtonTap,
    required this.onCloseButtonTap,
  });

  final String? title;
  final String message;

  final VoidCallback? onRetryButtonTap;
  final VoidCallback onCloseButtonTap;

  @override
  Widget build(BuildContext context) {
    if (onRetryButtonTap != null) {
      return CustomDialog(
        title: title ?? L.current.confirmation,
        content: Text(
          message,
          style: AppTextStyles.robotoLight16.copyWith(
            color: context.colors.onBackground,
          ),
          textAlign: TextAlign.center,
        ),
        positiveButtonText: L.current.retry,
        onPositiveButtonTap: onRetryButtonTap!,
        negativeButtonText: L.current.close,
        onNegativeButtonTap: onCloseButtonTap,
      );
    } else {
      return CustomDialog(
        title: title ?? L.current.confirmation,
        content: Text(
          message,
          style: AppTextStyles.robotoLight16.copyWith(
            color: context.colors.onBackground,
          ),
          textAlign: TextAlign.center,
        ),
        positiveButtonText: L.current.close,
        onPositiveButtonTap: onCloseButtonTap,
      );
    }
  }
}
