import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_template/app/dependencies.dart';
import 'package:flutter_web_template/presentation/pages/home/bloc/home_bloc.dart';
import 'package:flutter_web_template/presentation/pages/home/widget/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.tabIndex,
  });

  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<HomeBloc>()..add(InitialData(tabIndex: tabIndex)),
      child: HomeBody(tabIndex: tabIndex),
    );
  }
}
