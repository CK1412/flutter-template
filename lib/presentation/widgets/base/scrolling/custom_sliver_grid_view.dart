import 'dart:math';

import 'package:flutter/material.dart';

class CustomSliverGridView<T> extends StatelessWidget {
  const CustomSliverGridView({
    super.key,
    required this.itemsData,
    required this.itemBuilder,
    required this.showShimmerLoadingMore,
    required this.showShimmerRefreshing,
    required this.shimmerItemBuilder,
    required this.emptyDataWidget,
    required this.crossAxisCount,
    this.shimmerItemCount = 10,
    this.shrinkWrap = false,
    this.onLoadMore,
    this.crossAxisSpacing = 0.0,
    this.mainAxisSpacing = 0.0,
    this.childAspectRatio = 1.0,
  });

  final Widget? Function(BuildContext context, int index, T value) itemBuilder;
  final bool showShimmerLoadingMore;
  final bool showShimmerRefreshing;
  final int shimmerItemCount;
  final NullableIndexedWidgetBuilder shimmerItemBuilder;
  final bool shrinkWrap;
  final VoidCallback? onLoadMore;
  final int crossAxisCount;
  final List<T>? itemsData;
  final Widget emptyDataWidget;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    if (showShimmerRefreshing) {
      return SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          childAspectRatio: childAspectRatio,
        ),
        itemBuilder: shimmerItemBuilder,
        itemCount: shimmerItemCount,
      );
    }

    final List<T>? items = itemsData;

    if (items == null || items.isEmpty) {
      return SliverToBoxAdapter(child: emptyDataWidget);
    }

    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        final int childCount = showShimmerLoadingMore
            ? items.length + shimmerItemCount
            : items.length;

        if (showShimmerLoadingMore && index >= childCount - shimmerItemCount) {
          return shimmerItemBuilder.call(context, index);
        }

        if (!showShimmerLoadingMore &&
            !showShimmerRefreshing &&
            index == max(childCount - 2, 0)) {
          onLoadMore?.call();
        }
        return itemBuilder.call(context, index, items[index]);
      },
      itemCount: showShimmerLoadingMore
          ? items.length + shimmerItemCount
          : items.length,
    );
  }
}
