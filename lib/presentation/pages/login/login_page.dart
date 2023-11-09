import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/bloc/auth/auth_bloc.dart';
import '../../../app/navigation/app_navigator.dart';
import '../../../app/navigation/app_routes.dart';
import '../../../l10n/generated/l10n.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              child: Text(L.current.login),
              onPressed: () {
                context.read<AuthBloc>().add(const AppLoggedIn());
              },
            ),
            TextButton.icon(
              onPressed: () {
                AppNavigator.goRoute(AppRoute.signUp);
              },
              icon: const Icon(Icons.arrow_back_ios),
              label: Text(L.current.signUp),
            ),
          ],
        ),
      ),
    );
  }
}
