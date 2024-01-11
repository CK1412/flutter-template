import 'package:flutter/material.dart';

import '../../../l10n/generated/l10n.dart';
import '../../../shared/resources/resources.dart';
import 'custom_dialog.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({
    super.key,
    this.title,
    this.buttonTitle,
    required this.content,
    required this.onButtonTap,
    this.buttonTextStyle,
    this.message,
  }) : assert(
          content == null || message == null,
          'Cannot provide both a content and a message',
        );

  final String? title;
  final String? buttonTitle;
  final Widget? content;
  final String? message;
  final VoidCallback onButtonTap;
  final TextStyle? buttonTextStyle;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: title,
      content: message != null
          ? Text(
              message!,
              style: AppTextStyles.robotoLight16.copyWith(
                color: context.colors.onBackground,
              ),
              textAlign: TextAlign.center,
            )
          : content,
      positiveButtonText: buttonTitle ?? L.current.lbl_ok,
      onPositiveButtonTap: onButtonTap,
      positiveButtonTextStyle: buttonTextStyle,
    );
  }
}
