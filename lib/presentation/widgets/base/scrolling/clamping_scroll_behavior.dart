import 'package:flutter/material.dart';

class ClampingScrollBehavior extends ScrollBehavior {
  const ClampingScrollBehavior();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const ClampingScrollPhysics();
}
