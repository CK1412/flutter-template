import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_template/app/dependencies.dart';
import 'package:flutter_web_template/app/navigation/app_navigator.dart';
import 'package:flutter_web_template/app/navigation/app_routes.dart';
import 'package:flutter_web_template/data/session/session_call_back.dart';
import 'package:flutter_web_template/data/session/session_manager.dart';
import 'package:flutter_web_template/l10n/generated/l10n.dart';
import 'package:flutter_web_template/presentation/pages/home/bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
      create: (context) => getIt<HomeBloc>()..add(InitialData()),
      child: const _Page(),
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

class _Page extends StatelessWidget {
  const _Page();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Assets.icons.icFlutter.image(width: 100, height: 100),
            FilledButton(
              onPressed: () {
                SessionManager.clear();
              },
              child: Text(L.current.helloWorld),
            ),
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
            FilledButton(
              onPressed: () async {
                AppNavigator.goNamed(
                  AppRoutes.details.name,
                  queryParameters: {'id': '4'},
                );
              },
              child: const Text('Go details'),
            ),
          ],
        ),
      ),
    );
  }
}
