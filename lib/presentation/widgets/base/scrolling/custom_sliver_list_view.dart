import 'dart:math';

import 'package:flutter/material.dart';

class CustomSliverListView<T> extends StatefulWidget {
  const CustomSliverListView({
    super.key,
    this.controller,
    required this.itemsData,
    required this.itemBuilder,
    required this.showShimmerLoadingMore,
    required this.showShimmerRefreshing,
    required this.emptyDataWidget,
    this.shimmerItemCount = 10,
    required this.shimmerItemBuilder,
    this.shrinkWrap = false,
    this.onLoadMore,
  });

  final List<T>? itemsData;
  final ScrollController? controller;
  final Widget? Function(BuildContext context, int index, T value) itemBuilder;
  final bool showShimmerLoadingMore;
  final bool showShimmerRefreshing;
  final int shimmerItemCount;
  final NullableIndexedWidgetBuilder shimmerItemBuilder;
  final bool shrinkWrap;
  final VoidCallback? onLoadMore;
  final Widget emptyDataWidget;

  @override
  State<CustomSliverListView<T>> createState() => _CustomListViewState<T>();
}

class _CustomListViewState<T> extends State<CustomSliverListView<T>> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.controller ?? ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.showShimmerRefreshing) {
      return SliverList.builder(
        itemBuilder: widget.shimmerItemBuilder,
        itemCount: widget.shimmerItemCount,
      );
    }

    final List<T>? items = widget.itemsData;
    if (items == null || items.isEmpty) {
      return widget.emptyDataWidget;
    }

    return SliverList.builder(
      itemBuilder: (context, index) {
        final int childCount = widget.showShimmerLoadingMore
            ? items.length + widget.shimmerItemCount
            : items.length;

        if (widget.showShimmerLoadingMore &&
            index >= childCount - widget.shimmerItemCount) {
          return widget.shimmerItemBuilder.call(context, index);
        }

        if (!widget.showShimmerLoadingMore &&
            !widget.showShimmerRefreshing &&
            index == max(childCount - 1, 0)) {
          widget.onLoadMore?.call();
        }
        return widget.itemBuilder.call(context, index, items[index]);
      },
      itemCount: widget.showShimmerLoadingMore
          ? items.length + widget.shimmerItemCount
          : items.length,
    );
  }
}
