import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../app/navigation/app_navigator.dart';
import '../../../app/navigation/app_route_name.dart';
import '../../../app/resources/resources.dart';
import '../../../data/session/session_manager.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(
        const Duration(seconds: 2),
        () {
          appBootstrap();
        },
      );
    });
  }

  void appBootstrap() {
    if (SessionManager.instance.isLoggedIn) {
      AppNavigator.go(
        AppRouteName.home,
        action: AppNavigatorStackAction.removeAll,
      );
    } else {
      AppNavigator.go(
        AppRouteName.auth,
        action: AppNavigatorStackAction.removeAll,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Center(
        child: Assets.images.splashLogo.image(
          width: 100,
          height: 100,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
