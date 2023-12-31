import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/bloc/base/base_bloc.dart';
import '../../../app/bloc/base/common/common_bloc.dart';
import '../../../injection/injector.dart';
import '../../../shared/logger/logger.dart';
import 'base_page_mixin.dart';
import 'loading_visible.dart';

abstract class BasePageState<P extends StatefulWidget, B extends BaseBloc>
    extends State<P> with BasePageMixin {
  late final CommonBloc commonBloc = getIt<CommonBloc>();
  late final B bloc = getIt<B>()..commonBloc = commonBloc;

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
          create: (context) => bloc,
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<CommonBloc, CommonState>(
            listener: (context, state) {
              handleException(state.appExceptionWrapper!);
            },
            listenWhen: (previous, current) {
              return previous.appExceptionWrapper !=
                      current.appExceptionWrapper &&
                  current.appExceptionWrapper != null;
            },
          ),
          BlocListener<CommonBloc, CommonState>(
            listener: (context, state) {
              final message = state.blocMessage?.message;

              if (message != null) {
                showToast(message);
              }
            },
            listenWhen: (previous, current) {
              return previous.blocMessage != current.blocMessage &&
                  current.blocMessage != null;
            },
          ),
        ],
        child: Builder(
          builder: (ctx) {
            return Stack(
              children: [
                buildPage(ctx),
                BlocSelector<CommonBloc, CommonState, bool>(
                  selector: (state) => state.isLoading,
                  builder: (context, state) {
                    return LoadingVisible(isLoading: state);
                  },
                ),
              ],
            );
          },
        ),
      ),
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
