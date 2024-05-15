import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../app/bloc/auth/auth_bloc.dart';
import '../../../l10n/generated/l10n.dart';
import '../../common_widgets/common_scaffold.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              child: Text(L.current.lbl_sign_up),
              onPressed: () {
                context.read<AuthBloc>().add(const AppSignedUpRequested());
              },
            ),
            const Gap(20),
            FilledButton(
              child: Text(L.current.lbl_login),
              onPressed: () {
                context.read<AuthBloc>().add(const AppLoggedInRequested());
              },
            ),
          ],
        ),
      ),
    );
  }
}
