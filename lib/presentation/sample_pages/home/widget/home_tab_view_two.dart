import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/navigation/app_navigator.dart';
import '../../../../app/navigation/app_route_name.dart';
import '../bloc/home_bloc.dart';

class HomeTabViewTwo extends StatelessWidget {
  const HomeTabViewTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return FilledButton(
              onPressed: () {
                context.read<HomeBloc>().add(const CountIncreased());
              },
              child: Text('Count: ${state.count}'),
            );
          },
        ),
        const SizedBox(height: 20),
        FilledButton(
          onPressed: () {
            AppNavigator.go(
              AppRouteName.details,
              arguments: '4',
            );
          },
          child: const Text('Go details'),
        ),
      ],
    );
  }
}
