import 'package:flutter/material.dart';

import 'refresh_indicator_forced.dart';

class CustomListView<T> extends StatefulWidget {
  const CustomListView({
    super.key,
    this.controller,
    required this.itemsData,
    required this.showShimmerLoadingMore,
    required this.showShimmerRefreshing,
    required this.itemBuilder,
    required this.shimmerItemBuilder,
    required this.emptyDataWidget,
    this.shimmerItemCount = 10,
    this.padding,
    this.shrinkWrap = false,
    this.scrollDirection = Axis.vertical,
    this.onLoadMore,
    this.onRefresh,
    this.clipBehavior = Clip.hardEdge,
  });

  final List<T>? itemsData;
  final ScrollController? controller;
  final Widget? Function(BuildContext context, int index, T value) itemBuilder;
  final bool showShimmerLoadingMore;
  final bool showShimmerRefreshing;
  final int shimmerItemCount;
  final NullableIndexedWidgetBuilder shimmerItemBuilder;
  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;
  final Axis scrollDirection;
  final VoidCallback? onLoadMore;
  final Widget emptyDataWidget;
  final VoidCallback? onRefresh;
  final Clip clipBehavior;

  @override
  State<CustomListView<T>> createState() => _CustomListViewState<T>();
}

class _CustomListViewState<T> extends State<CustomListView<T>> {
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
      return ListView.builder(
        itemBuilder: widget.shimmerItemBuilder,
        itemCount: widget.shimmerItemCount,
        padding: widget.padding,
        shrinkWrap: widget.shrinkWrap,
        scrollDirection: widget.scrollDirection,
        clipBehavior: widget.clipBehavior,
      );
    }

    final List<T>? items = widget.itemsData;
    if (items == null || items.isEmpty) {
      return RefreshIndicatorForced(
        onRefresh: () {
          widget.onRefresh?.call();
          return Future(() => false);
        },
        child: widget.emptyDataWidget,
      );
    }

    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          if (!widget.showShimmerLoadingMore &&
              !widget.showShimmerRefreshing &&
              _scrollController.position.extentAfter == 0) {
            widget.onLoadMore?.call();
          }
        }
        return false;
      },
      child: RefreshIndicator(
        onRefresh: () {
          widget.onRefresh?.call();
          return Future(() => false);
        },
        child: ListView.builder(
          clipBehavior: widget.clipBehavior,
          physics: const AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
          itemBuilder: (context, index) {
            final int childCount = widget.showShimmerLoadingMore
                ? items.length + widget.shimmerItemCount
                : items.length;

            if (widget.showShimmerLoadingMore &&
                index >= childCount - widget.shimmerItemCount) {
              return widget.shimmerItemBuilder.call(context, index);
            }

            return widget.itemBuilder.call(context, index, items[index]);
          },
          itemCount: widget.showShimmerLoadingMore
              ? items.length + widget.shimmerItemCount
              : items.length,
          padding: widget.padding,
          shrinkWrap: widget.shrinkWrap,
          scrollDirection: widget.scrollDirection,
        ),
      ),
    );
  }
}
