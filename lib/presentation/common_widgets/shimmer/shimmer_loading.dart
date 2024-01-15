import 'package:flutter/material.dart';

import 'ancestor_shimmer.dart';

class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({
    required this.isLoading,
    required this.child,
    this.loadingWidget,
    super.key,
  });

  final Widget child;
  final Widget? loadingWidget;
  final bool isLoading;

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  Listenable? _shimmerChanges;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_shimmerChanges != null) {
      _shimmerChanges!.removeListener(_onShimmerChange);
    }
    _shimmerChanges = AncestorShimmer.of(context)?.shimmerChanges;
    if (_shimmerChanges != null) {
      _shimmerChanges!.addListener(_onShimmerChange);
    }
  }

  @override
  void dispose() {
    _shimmerChanges?.removeListener(_onShimmerChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    // Collect ancestor shimmer info.
    final shimmer = AncestorShimmer.of(context);
    if (shimmer == null || !shimmer.isSized) {
      // The ancestor Shimmer widget has not laid
      // itself out yet. Return an empty box.
      return const SizedBox();
    }
    final Size? shimmerSize = shimmer.size;
    if (shimmerSize == null) {
      return const SizedBox();
    }

    final LinearGradient gradient = shimmer.gradient;
    final RenderBox? descendant = context.findRenderObject() as RenderBox?;
    Offset offsetWithinShimmer = Offset.zero;
    try {
      offsetWithinShimmer = descendant != null
          ? shimmer.getDescendantOffset(
              descendant: descendant,
            )
          : Offset.zero;
    } catch (e) {
      // Known issue: null pointer exception
    }

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(
            -offsetWithinShimmer.dx,
            -offsetWithinShimmer.dy,
            shimmerSize.width,
            shimmerSize.height,
          ),
        );
      },
      child: widget.loadingWidget ?? widget.child,
    );
  }

  void _onShimmerChange() {
    if (widget.isLoading) {
      setState(() {
        // update the shimmer painting.
      });
    }
  }
}
