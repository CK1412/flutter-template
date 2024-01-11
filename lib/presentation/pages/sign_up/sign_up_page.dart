import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/bloc/auth/auth_bloc.dart';
import '../../../app/navigation/app_navigator.dart';
import '../../../app/navigation/app_routes.dart';
import '../../../l10n/generated/l10n.dart';
import '../../common_widgets/base/base_page.dart';
import '../../common_widgets/base/common_scaffold.dart';
import 'bloc/sign_up_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends BasePageState<SignUpPage, SignUpBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              child: Text(L.current.lbl_sign_up),
              onPressed: () {
                context.read<AuthBloc>().add(const AppSignedUp());
              },
            ),
            TextButton.icon(
              onPressed: () {
                AppNavigator.goRoute(AppRoute.login);
              },
              icon: const Icon(Icons.arrow_back_ios),
              label: Text(L.current.lbl_login),
            ),
          ],
        ),
      ),
    );
  }
}
