import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_template/app/navigation/app_navigator.dart';
import 'package:flutter_web_template/app/navigation/app_routes.dart';
import 'package:flutter_web_template/presentation/pages/home/bloc/home_bloc.dart';

class HomeTabViewTwo extends StatefulWidget {
  const HomeTabViewTwo({super.key});

  @override
  State<HomeTabViewTwo> createState() => _HomeTabViewTwoState();
}

class _HomeTabViewTwoState extends State<HomeTabViewTwo>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return FilledButton(
              onPressed: () {
                context.read<HomeBloc>().add(CountIncreased());
              },
              child: Text('Count: ${state.count}'),
            );
          },
        ),
        const SizedBox(height: 20),
        FilledButton(
          onPressed: () {
            AppNavigator.goRoute(
              AppRoutes.details,
              queryParameters: {'id': '4'},
              withCurrentPathParams: true,
            );
          },
          child: const Text('Go details'),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
