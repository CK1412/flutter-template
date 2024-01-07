import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/bloc/auth/auth_bloc.dart';
import '../../../../domain/entities/user/user_entity.dart';
import '../../../../shared/resources/resources.dart';
import '../../../common_widgets/divider/common_horizontal_divider.dart';
import '../bloc/home_bloc.dart';

class HomeTabViewOne extends StatefulWidget {
  const HomeTabViewOne({super.key});

  @override
  State<HomeTabViewOne> createState() => _HomeTabViewOneState();
}

class _HomeTabViewOneState extends State<HomeTabViewOne>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              final UserEntity? user = state.user;

              if (user != null) {
                return Text(user.toString());
              } else {
                return ElevatedButton(
                  onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(const LoggedInUserInformationFetched());
                  },
                  child: const Text('View user information'),
                );
              }
            },
            buildWhen: (previous, current) {
              return previous.user != current.user;
            },
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
