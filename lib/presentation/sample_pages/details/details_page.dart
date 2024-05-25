import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../app/navigation/app_navigator.dart';
import '../../../l10n/generated/l10n.dart';
import '../../widgets/app/app_bar/common_app_bar.dart';
import '../../widgets/app/scaffold/common_scaffold.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        title: L.current.lbl_detail,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Id: $id'),
            FilledButton(
              onPressed: () {
                AppNavigator.pop();
              },
              child: const Text('Pop page'),
            ),
            const Gap(1000),
          ],
        ),
      ),
    );
  }
}
