import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../shared/resources/resources.dart';
import '../../../app/navigation/app_navigator.dart';
import '../../../app/navigation/app_route_name.dart';

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
    // Handle logic to navigate
    AppNavigator.go(
      AppRouteName.home,
      arguments: 0,
      action: AppNavigatorStackAction.removeAll,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Center(
        child: Assets.images.splashLogo.image(
          width: AppDimens.spacing200,
          height: AppDimens.spacing200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
