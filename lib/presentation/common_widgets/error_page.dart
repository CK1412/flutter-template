import 'package:flutter/material.dart';
import 'package:flutter_web_template/l10n/generated/l10n.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(L.current.anErrorHasOccurred),
      ),
    );
  }
}
