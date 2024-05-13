import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../app/navigation/app_navigator.dart';
import '../../../l10n/generated/l10n.dart';
import '../../../shared/resources/resources.dart';
import '../../common_widgets/app_bar/common_app_bar.dart';
import '../../common_widgets/common_scaffold.dart';
import '../../common_widgets/shimmer/shimmer_loading.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.id});

  final String id;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool _loading = false;

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
            Text('Id: ${widget.id}'),
            FilledButton(
              onPressed: () {
                AppNavigator.pop();
              },
              child: const Text('Pop page'),
            ),
            FilledButton(
              onPressed: () {
                setState(() {
                  _loading = true;
                });
                Future.delayed(
                  const Duration(seconds: 3),
                  () {
                    setState(() {
                      _loading = false;
                    });
                  },
                );
              },
              child: const Text('Test Shimmer loading'),
            ),
            ShimmerLoading(
              isLoading: _loading,
              child: Container(
                width: double.maxFinite,
                color: Colors.amberAccent,
                height: AppDimens.spacing100,
                margin:
                    const EdgeInsets.symmetric(horizontal: AppInsets.inset16),
              ),
            ),
            const Gap(AppDimens.spacing1000),
          ],
        ),
      ),
    );
  }
}
