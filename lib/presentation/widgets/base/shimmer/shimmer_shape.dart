import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerShape extends StatelessWidget {
  final double? width;
  final double? height;
  final ShapeBorder shapeBorder;
  final EdgeInsetsGeometry? margin;

  const ShimmerShape.rectangular({
    super.key,
    this.width,
    this.height,
    this.margin,
  }) : shapeBorder = const RoundedRectangleBorder();

  const ShimmerShape.circular({
    super.key,
    required this.width,
    required this.height,
    this.margin,
  }) : shapeBorder = const CircleBorder();

  const ShimmerShape.square({
    super.key,
    required double dimension,
    this.margin,
  })  : width = dimension,
        height = dimension,
        shapeBorder = const RoundedRectangleBorder();

  Color get _getBaseColor => Colors.grey.shade300;

  Color get _getHighlightColor => Colors.grey.shade200;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      constraints: BoxConstraints.expand(
        width: width,
        height: height ?? double.maxFinite,
      ),
      child: Shimmer.fromColors(
        baseColor: _getBaseColor,
        highlightColor: _getHighlightColor,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: Container(
            width: width,
            height: height,
            decoration: ShapeDecoration(
              color: _getHighlightColor,
              shape: shapeBorder,
            ),
          ),
        ),
      ),
    );
  }
}
