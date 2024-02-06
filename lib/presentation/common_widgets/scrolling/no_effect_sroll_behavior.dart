import 'package:flutter/material.dart';

class NoEffectScrollBehavior extends ScrollBehavior {
  const NoEffectScrollBehavior();

  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}
