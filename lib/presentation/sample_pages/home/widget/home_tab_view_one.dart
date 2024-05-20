import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/session/session_manager.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../../../shared/utils/dialog_utils.dart';
import '../../../widgets/base/divider/common_horizontal_divider.dart';
import '../bloc/home_bloc.dart';

class HomeTabViewOne extends StatelessWidget {
  const HomeTabViewOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Token" ${SessionManager.instance.accessToken}'),
          const CommonHorizontalDivider(height: 10),
          ElevatedButton(
            onPressed: () {
              context.read<HomeBloc>().add(
                UserInfoFetched(
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
                    UserInfoFetched(
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
