import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_template/app/bloc/auth/auth_bloc.dart';
import 'package:flutter_web_template/app/navigation/app_navigator.dart';
import 'package:flutter_web_template/app/navigation/app_routes.dart';
import 'package:flutter_web_template/l10n/generated/l10n.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              child: Text(L.current.signUp),
              onPressed: () {
                context.read<AuthBloc>().add(const AppSignedUp());
              },
            ),
            TextButton.icon(
              onPressed: () {
                AppNavigator.goRoute(AppRoute.login);
              },
              icon: const Icon(Icons.arrow_back_ios),
              label: Text(L.current.login),
            ),
          ],
        ),
      ),
    );
  }
}
