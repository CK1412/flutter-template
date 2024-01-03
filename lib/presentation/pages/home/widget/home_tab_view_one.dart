import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/bloc/auth/auth_bloc.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            // return Text('UserName: ${state.userInfo!.userName}');
            return Text('UserName" ${state.authInfo?.token}');
          },
        ),
        // Assets.icons.icFlutter.image(width: 100, height: 100),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
