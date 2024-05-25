import 'package:flutter/material.dart';

import '../../../../app/resources/resources.dart';

class CommonVerticalDivider extends StatelessWidget {
  const CommonVerticalDivider({
    super.key,
    this.width,
    this.color,
    this.thickness,
  });

  final double? width;
  final Color? color;
  final double? thickness;

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      width: width ?? 0.5,
      color: color ?? context.colors.outlineVariant,
      thickness: thickness,
    );
  }
}
