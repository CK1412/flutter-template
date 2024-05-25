import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/bloc/base/base_bloc.dart';
import '../../../app/bloc/common/common_bloc.dart';
import '../../../injection/injector.dart';
import '../../../shared/logger/logger.dart';
import 'base_common_listener.dart';
import 'base_page_mixin.dart';

abstract class BasePageState<P extends StatefulWidget, B extends BaseBloc>
    extends State<P> with BasePageMixin {
  final CommonBloc commonBloc = getIt<CommonBloc>();
  final B bloc = getIt<B>();

  @override
  void initState() {
    super.initState();
    onInitState();
  }

  @override
  void dispose() {
    onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => commonBloc,
        ),
        BlocProvider(
          create: (context) => bloc..commonBloc = commonBloc,
        ),
      ],
      child: BaseCommonListener(builder: buildPage),
    );
  }

  @mustCallSuper
  void onInitState() {
    logger.d('Init State: $runtimeType');
  }

  @mustCallSuper
  void onDispose() {
    logger.d('Dispose: $runtimeType');
  }
}
