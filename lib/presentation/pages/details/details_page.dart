import 'package:flutter/material.dart';

import '../../../app/navigation/app_navigator.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
          ],
        ),
      ),
    );
  }
}
