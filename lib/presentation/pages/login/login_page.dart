import 'package:flutter/material.dart';
import 'package:flutter_web_template/l10n/generated/l10n.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(L.current.login),
      ),
    );
  }
}
