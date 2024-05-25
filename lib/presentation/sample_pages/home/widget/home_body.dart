import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/app/app_bar/common_app_bar.dart';
import '../../../widgets/app/scaffold/common_scaffold.dart';
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
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: HomeTab.values.length,
      vsync: this,
      initialIndex: widget.tabIndex,
    );
  }

  @override
  void didUpdateWidget(covariant HomeBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.tabIndex != widget.tabIndex) {
      _tabController.index = widget.tabIndex;
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
        appBar: CommonAppBar(
          leadingIcon: AppBarLeadingIcon.none,
          bottom: TabBar(
            controller: _tabController,
            tabs: HomeTab.values
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(e.name),
                  ),
                )
                .toList(),
            indicatorSize: TabBarIndicatorSize.tab,
            onTap: (int index) {
              context.read<HomeBloc>().add(TabIndexChanged(index));
            },
          ),
        ),
        body: TabBarView(
          controller: _tabController,

          /// because children of TabBarView above use `const` keyword,
          /// therefore, [children] will not updated when AppBloc builder called.
          children: const [
            HomeTabViewOne(),
            HomeTabViewTwo(),
            HomeTabViewThree(),
          ],
        ),
      ),
    );
  }
}

enum HomeTab {
  tab1,
  tab2,
  tab3,
}
