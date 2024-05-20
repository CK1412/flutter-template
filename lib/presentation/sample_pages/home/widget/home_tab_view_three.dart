import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/bloc/auth/auth_bloc.dart';
import '../../../../app/navigation/app_navigator.dart';
import '../../../../app/navigation/app_route_name.dart';
import '../../../../l10n/generated/l10n.dart';

class HomeTabViewThree extends StatelessWidget {
  const HomeTabViewThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FilledButton(
          onPressed: () {
            AppNavigator.go(AppRouteName.settings);
          },
          child: Text(L.current.lbl_settings),
        ),
        FilledButton(
          onPressed: () {
            context.read<AuthBloc>().add(
              AppLogoutRequested(
                onSuccessCallback: () {
                  AppNavigator.go(
                    AppRouteName.auth,
                    action: AppNavigatorStackAction.removeAll,
                  );
                },
              ),
            );
          },
          child: Text(L.current.lbl_log_out),
        ),
      ],
    );
  }
}
