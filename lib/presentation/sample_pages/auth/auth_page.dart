import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../app/bloc/auth/auth_bloc.dart';
import '../../../app/navigation/app_navigator.dart';
import '../../../app/navigation/app_route_name.dart';
import '../../../l10n/generated/l10n.dart';
import '../../widgets/app/scaffold/common_scaffold.dart';

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
                context.read<AuthBloc>().add(
                  AppSignedUpRequested(
                    onSuccessCallback: () {
                      AppNavigator.go(
                        AppRouteName.home,
                        action: AppNavigatorStackAction.removeAll,
                      );
                    },
                  ),
                );
              },
            ),
            const Gap(20),
            FilledButton(
              child: Text(L.current.lbl_login),
              onPressed: () {
                context.read<AuthBloc>().add(
                  AppLoggedInRequested(
                    onSuccessCallback: () {
                      AppNavigator.go(
                        AppRouteName.home,
                        action: AppNavigatorStackAction.removeAll,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
