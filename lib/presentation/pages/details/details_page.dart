import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../app/navigation/app_navigator.dart';
import '../../../l10n/generated/l10n.dart';
import '../../common_widgets/app_bar/common_app_bar.dart';
import '../../common_widgets/base/common_scaffold.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        title: L.current.detail,
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
            Container(
              width: double.maxFinite,
              color: Colors.amberAccent,
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),
            const Gap(1000),
          ],
        ),
      ),
    );
  }
}
