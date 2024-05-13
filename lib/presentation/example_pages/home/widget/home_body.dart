import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/navigation/app_navigator.dart';
import '../../../../app/navigation/app_routes.dart';
import '../../../../app/navigation/route_params.dart';
import '../../../common_widgets/common_scaffold.dart';
import '../bloc/home_bloc.dart';
import 'home_tab_view_one.dart';
import 'home_tab_view_three.dart';
import 'home_tab_view_two.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    super.key,
    required this.tabIndex,
  });

  final int tabIndex;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> with TickerProviderStateMixin {
  final List<({Tab tabBar, Widget tabView})> _tabs = [
    (
      tabBar: const Tab(text: 'Tab 1'),
      tabView: const HomeTabViewOne(),
    ),
    (
      tabBar: const Tab(text: 'Tab 2'),
      tabView: const HomeTabViewTwo(),
    ),
    (
      tabBar: const Tab(text: 'Tab 3'),
      tabView: const HomeTabViewThree(),
    ),
  ];

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
      initialIndex: widget.tabIndex,
    );
  }

  @override
  void didUpdateWidget(covariant HomeBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.tabIndex != widget.tabIndex) {
      context.read<HomeBloc>().add(TabIndexChanged(widget.tabIndex));
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        _tabController.index = state.tabIndex;
      },
      listenWhen: (previous, current) {
        return previous.tabIndex != current.tabIndex;
      },
      child: CommonScaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: _tabController,
            tabs: _tabs.map((e) => e.tabBar).toList(),
            onTap: (int index) {
              context.read<HomeBloc>().add(TabIndexChanged(index));
              AppNavigator.goRoute(
                AppRoute.home,
                pathParameters: {RouteParamsKey.tab: '$index'},
              );
            },
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: _tabs.map((e) => e.tabView).toList(),
        ),
      ),
    );
  }
}
