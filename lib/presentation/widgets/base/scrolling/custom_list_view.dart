import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'refresh_indicator_forced.dart';

class CustomListView<T> extends StatefulWidget {
  const CustomListView({
    super.key,
    this.controller,
    required this.data,
    required this.isLoadingMore,
    required this.noDataBuilder,
    required this.itemBuilder,
    required this.itemLoadingBuilder,
    this.padding,
    this.shrinkWrap = false,
    this.scrollDirection = Axis.vertical,
    this.onLoadMore,
    this.onRefresh,
    this.clipBehavior = Clip.hardEdge,
  });

  final List<T>? data;
  final WidgetBuilder noDataBuilder;
  final VoidCallback? onRefresh;
  final ScrollController? controller;
  final bool isLoadingMore;
  final VoidCallback? onLoadMore;
  final Widget? Function(BuildContext context, int index, T value) itemBuilder;
  final WidgetBuilder itemLoadingBuilder;
  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;
  final Axis scrollDirection;
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
    if (widget.controller == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  void _checkLoadMore() {
    if (!_scrollController.hasClients || widget.isLoadingMore) {
      return;
    }

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        return widget.onLoadMore?.call();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<T>? items = widget.data;

    if (items == null || items.isEmpty) {
      return RefreshIndicatorForced(
        onRefresh: () {
          return Future(() => widget.onRefresh?.call());
        },
        child: widget.noDataBuilder.call(context),
      );
    }

    final int itemCount = items.length + (widget.isLoadingMore ? 1 : 0);

    return RefreshIndicator(
      onRefresh: () {
        return Future(() => widget.onRefresh?.call());
      },
      child: ListView.builder(
        clipBehavior: widget.clipBehavior,
        physics: const AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        itemBuilder: (context, index) {
          if (widget.isLoadingMore && index == itemCount - 1) {
            return widget.itemLoadingBuilder.call(context);
          }

          if (index == itemCount - 1) {
            _checkLoadMore();
          }

          return widget.itemBuilder.call(context, index, items[index]);
        },
        itemCount: itemCount,
        padding: widget.padding,
        shrinkWrap: widget.shrinkWrap,
        scrollDirection: widget.scrollDirection,
      ),
    );
  }
}
