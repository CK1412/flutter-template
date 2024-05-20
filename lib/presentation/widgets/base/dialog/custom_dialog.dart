import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quiver/strings.dart';

import '../../../../app/resources/constants.dart';
import '../../../../app/resources/resources.dart';
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
  final Widget? content;

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
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        constraints: const BoxConstraints(
          minWidth: Constants.dialogMinWidth,
          maxWidth: Constants.dialogMaxWidth,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  if (isNotEmpty(title))
                    Text(
                      title!,
                      style: AppTextStyles.robotoMedium16.copyWith(
                        color: context.colors.onBackground,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  if (isNotEmpty(title)) const Gap(8),
                  if (content != null) content!,
                ],
              ),
            ),
            const CommonHorizontalDivider(),
            SizedBox(
              height: 44,
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
