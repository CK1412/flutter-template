import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quiver/strings.dart';

import '../../../shared/resources/resources.dart';
import '../divider/common_horizontal_divider.dart';
import '../divider/common_vertical_divider.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    this.title,
    required this.content,
    required this.positiveButtonText,
    required this.onPositiveButtonTap,
    this.positiveButtonTextStyle,
    this.negativeButtonText,
    this.onNegativeButtonTap,
    this.negativeButtonTextStyle,
  });

  final String? title;
  final Widget content;

  final String positiveButtonText;
  final VoidCallback onPositiveButtonTap;
  final TextStyle? positiveButtonTextStyle;

  final String? negativeButtonText;
  final VoidCallback? onNegativeButtonTap;
  final TextStyle? negativeButtonTextStyle;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.r12),
      ),
      child: Container(
        constraints: const BoxConstraints(
          minWidth: AppDimens.spacing280,
          maxWidth: AppDimens.spacing560,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppInsets.inset16),
              child: Column(
                children: [
                  if (isNotEmpty(title))
                    Text(
                      title!,
                      style: AppTextStyles.robotoMedium16.copyWith(
                        color: context.colors.onBackground,
                      ),
                    ),
                  if (isNotEmpty(title)) const Gap(AppDimens.spacing8),
                  content,
                ],
              ),
            ),
            const CommonHorizontalDivider(),
            SizedBox(
              height: AppDimens.spacing44,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (isNotEmpty(negativeButtonText) &&
                      onNegativeButtonTap != null)
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: onNegativeButtonTap,
                        child: Center(
                          child: Text(
                            negativeButtonText!,
                            textAlign: TextAlign.center,
                            style: negativeButtonTextStyle ??
                                AppTextStyles.robotoRegular16.copyWith(
                                  color: context.colors.onBackground,
                                ),
                          ),
                        ),
                      ),
                    ),
                  const CommonVerticalDivider(),
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: onPositiveButtonTap,
                      child: Center(
                        child: Text(
                          positiveButtonText,
                          textAlign: TextAlign.center,
                          style: positiveButtonTextStyle ??
                              AppTextStyles.robotoRegular16.copyWith(
                                color: context.colors.primary,
                              ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
