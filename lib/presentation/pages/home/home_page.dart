import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_template/app/dependencies.dart';
import 'package:flutter_web_template/data/session/session_call_back.dart';
import 'package:flutter_web_template/presentation/pages/home/bloc/home_bloc.dart';
import 'package:flutter_web_template/presentation/pages/home/widget/home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.tabIndex,
  });

  final int tabIndex;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SessionCallback {
  @override
  void initState() {
    super.initState();

    /// Example
    // SessionManager.addAvailableListener(
    //   'notification when logout',
    //   key: 'key',
    //   listener: this,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<HomeBloc>()..add(InitialData(tabIndex: widget.tabIndex)),
      child: HomeBody(tabIndex: widget.tabIndex),
    );
  }

  @override
  void onListenerRemoved() {
    // TODO: implement onListenerRemoved
  }

  @override
  void onSessionChanged({String? message}) {
    // TODO: implement onSessionChanged
  }
}
