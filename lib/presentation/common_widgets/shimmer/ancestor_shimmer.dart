import 'package:flutter/material.dart';

class AncestorShimmer extends StatefulWidget {
  const AncestorShimmer({
    this.child,
    super.key,
  });

  final Widget? child;

  // ignore: library_private_types_in_public_api
  static _AncestorShimmerState? of(BuildContext context) {
    return context.findAncestorStateOfType<_AncestorShimmerState>();
  }

  @override
  State<AncestorShimmer> createState() => _AncestorShimmerState();
}

class _AncestorShimmerState extends State<AncestorShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  static final LinearGradient _shimmerGradient = LinearGradient(
    colors: [
      Colors.grey.shade200,
      Colors.grey.shade100,
      Colors.grey.shade200,
    ],
    stops: const [
      0.1,
      0.3,
      0.4,
    ],
    begin: const Alignment(-1, -0.3),
    end: const Alignment(1, 0.3),
    tileMode: TileMode.clamp,
  );

  LinearGradient get gradient => LinearGradient(
        colors: _shimmerGradient.colors,
        stops: _shimmerGradient.stops,
        begin: _shimmerGradient.begin,
        end: _shimmerGradient.end,
        transform:
            _SlidingGradientTransform(slidePercent: _shimmerController.value),
      );

  RenderBox? get renderBox => context.findRenderObject() is RenderBox
      ? (context.findRenderObject()! as RenderBox)
      : null;

  bool get isSized => renderBox?.hasSize ?? false;

  Size? get size => renderBox?.size;

  Listenable get shimmerChanges => _shimmerController;

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(
        min: -0.5,
        max: 1.5,
        period: const Duration(milliseconds: 1000),
      );
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    final shimmerBox = context.findRenderObject() as RenderBox?;
    return descendant.localToGlobal(offset, ancestor: shimmerBox);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0, 0);
  }
}
