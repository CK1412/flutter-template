import 'package:flutter/material.dart';

/// Refresh indicator for non-scrollable widgets
class RefreshIndicatorForced extends StatelessWidget {
  const RefreshIndicatorForced({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  final RefreshCallback onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          SliverFillRemaining(
            child: child,
          ),
        ],
      ),
    );
  }
}
