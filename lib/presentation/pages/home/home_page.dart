import 'package:flutter/material.dart';

import '../../common_widgets/base/base_page.dart';
import 'bloc/home_bloc.dart';
import 'widget/home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.tabIndex,
  });

  final int tabIndex;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage, HomeBloc> {
  @override
  void onInitState() {
    super.onInitState();
    bloc.add(InitialData(tabIndex: widget.tabIndex));
  }

  @override
  Widget buildPage(BuildContext context) {
    return HomeBody(
      tabIndex: widget.tabIndex,
    );
  }
}
