import 'package:flutter/material.dart';

import '../../../shared/utils/platform_utils.dart';
import '../../../shared/utils/view_utils.dart';

class CommonScaffold extends StatelessWidget {
  const CommonScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.drawer,
    this.endDrawer,
    this.backgroundColor,
    this.floatingActionButton,
    this.bottomSheet,
    this.bottomNavigationBar,
    this.extendBodyBehindAppBar = false,
    this.resizeToAvoidBottomInset = false,
    this.tapOutsideToHideKeyboard = true,
    this.onWillPop,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final Color? backgroundColor;
  final Widget? floatingActionButton;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final bool extendBodyBehindAppBar;
  final bool resizeToAvoidBottomInset;
  final bool tapOutsideToHideKeyboard;
  final WillPopCallback? onWillPop;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: PlatformUtils.isIOSDevice ? null : onWillPop,
      child: SafeArea(
        child: tapOutsideToHideKeyboard
            ? GestureDetector(
                onTap: () {
                  if (tapOutsideToHideKeyboard) {
                    ViewUtils.hideKeyboard(context);
                  }
                },
                child: _buildScaffold(context),
              )
            : _buildScaffold(context),
      ),
    );
  }

  Widget _buildScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: appBar,
      body: body,
      drawer: drawer,
      endDrawer: endDrawer,
      floatingActionButton: floatingActionButton,
      bottomSheet: bottomSheet,
      bottomNavigationBar: bottomNavigationBar,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }
}
