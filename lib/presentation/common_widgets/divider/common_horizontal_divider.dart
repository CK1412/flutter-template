import 'package:flutter/material.dart';

import '../../../shared/resources/resources.dart';

class CommonHorizontalDivider extends StatelessWidget {
  const CommonHorizontalDivider({
    super.key,
    this.height,
    this.thickness,
    this.color,
  });

  final double? height;
  final double? thickness;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height ?? 0.5,
      color: color ?? context.colors.outlineVariant,
      thickness: thickness,
    );
  }
}
