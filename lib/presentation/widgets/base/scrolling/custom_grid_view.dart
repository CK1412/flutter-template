import 'dart:math';

import 'package:flutter/material.dart';

class CustomGridView<T> extends StatelessWidget {
  const CustomGridView({
    super.key,
    required this.itemsData,
    required this.showShimmerRefreshing,
    required this.showShimmerLoadingMore,
    required this.itemBuilder,
    required this.shimmerItemBuilder,
    required this.crossAxisCount,
    required this.emptyDataWidget,
    this.shimmerItemCount = 10,
    this.shrinkWrap = false,
    this.onLoadMore,
    this.crossAxisSpacing = 0.0,
    this.mainAxisSpacing = 0.0,
    this.childAspectRatio = 1.0,
    this.scrollDirection = Axis.vertical,
    this.padding,
    this.onRefresh,
    this.clipBehavior = Clip.hardEdge,
  });

  final List<T>? itemsData;
  final Widget? Function(BuildContext context, int index, T value) itemBuilder;
  final bool showShimmerLoadingMore;
  final bool showShimmerRefreshing;
  final int shimmerItemCount;
  final NullableIndexedWidgetBuilder shimmerItemBuilder;
  final bool shrinkWrap;
  final VoidCallback? onLoadMore;
  final int crossAxisCount;
  final Widget emptyDataWidget;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;
  final Axis scrollDirection;
  final EdgeInsets? padding;
  final VoidCallback? onRefresh;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    if (showShimmerRefreshing) {
      return GridView.builder(
        padding: padding,
        scrollDirection: scrollDirection,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          childAspectRatio: childAspectRatio,
        ),
        itemBuilder: shimmerItemBuilder,
        itemCount: shimmerItemCount,
        clipBehavior: clipBehavior,
      );
    }

    final List<T>? items = itemsData;

    if (items == null || items.isEmpty) {
      return emptyDataWidget;
    }

    return RefreshIndicator(
      onRefresh: () async {
        return onRefresh?.call();
      },
      child: GridView.builder(
        scrollDirection: scrollDirection,
        physics: const AlwaysScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          childAspectRatio: childAspectRatio,
        ),
        padding: padding,
        itemBuilder: (context, index) {
          final int childCount = showShimmerLoadingMore
              ? items.length + shimmerItemCount
              : items.length;

          if (showShimmerLoadingMore &&
              index >= childCount - shimmerItemCount) {
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
        clipBehavior: clipBehavior,
      ),
    );
  }
}
