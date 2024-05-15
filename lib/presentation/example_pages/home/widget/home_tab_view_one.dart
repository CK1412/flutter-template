import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/bloc/auth/auth_bloc.dart';
import '../../../../domain/entities/user/user_entity.dart';
import '../../../../shared/resources/resources.dart';
import '../../../../shared/utils/dialog_utils.dart';
import '../../../common_widgets/divider/common_horizontal_divider.dart';
import '../bloc/home_bloc.dart';

class HomeTabViewOne extends StatelessWidget {
  const HomeTabViewOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppInsets.inset16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Text('Token" ${state.authInfo?.token}');
            },
          ),
          const CommonHorizontalDivider(height: AppDimens.spacing10),
          ElevatedButton(
            onPressed: () {
              context.read<HomeBloc>().add(
                LoggedInUserInformationFetched(
                  onSuccessCallback: () {
                    final UserEntity? user =
                        context.read<HomeBloc>().state.user;
                    if (user != null) {
                      DialogUtils.showInfoDialog(
                        content: Text(user.toString()),
                      );
                    }
                  },
                ),
              );
            },
            child: const Text('Get user information'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<HomeBloc>().add(
                    LoggedInUserInformationFetched(
                      userId: 23,
                      onSuccessCallback: () {
                        final UserEntity? user =
                            context.read<HomeBloc>().state.user;
                        if (user != null) {
                          DialogUtils.showInfoDialog(
                            content: Text(user.toString()),
                          );
                        }
                      },
                    ),
                  );
            },
            child: const Text('Get user information fail'),
          ),
        ],
      ),
    );
  }
}
