import 'package:flutter/material.dart';
import 'package:flutter_web_template/data/session/session_call_back.dart';
import 'package:flutter_web_template/data/session/session_manager.dart';
import 'package:flutter_web_template/gen/assets.gen.dart';
import 'package:flutter_web_template/l10n/generated/l10n.dart';

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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.icons.icFlutter.image(width: 100, height: 100),
            FilledButton(
              onPressed: () {
                SessionManager.clear();
              },
              child: Text(L.current.hello_world),
            ),
          ],
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
