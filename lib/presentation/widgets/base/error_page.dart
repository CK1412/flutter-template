import 'package:flutter/material.dart';

import '../../../app/resources/resources.dart';
import '../../../l10n/generated/l10n.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: Center(
        child: Text(
          L.current.lbl_an_error_has_occurred,
          style: AppTextStyles.robotoMedium14.copyWith(
            color: context.colors.error,
          ),
        ),
      ),
    );
  }
}
