import 'package:flutter/material.dart';

import '../../l10n/generated/l10n.dart';
import '../../shared/resources/resources.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: Center(
        child: Text(
          L.current.anErrorHasOccurred,
          style: AppTextStyles.robotoMedium14.copyWith(
            color: context.colors.error,
          ),
        ),
      ),
    );
  }
}
