import 'package:flutter/material.dart';
import 'package:flutter_web_template/data/session/session_call_back.dart';
import 'package:flutter_web_template/data/session/session_manager.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with SessionCallback {
  @override
  void initState() {
    super.initState();

    /// Example
    SessionManager.addAvailableListener(
      'notification when logout',
      key: 'key',
      listener: this,
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter template',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(
          child: FilledButton(
            onPressed: () {
              SessionManager.clear();
            },
            child: const Text('data'),
          ),
        ),
      ),
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
