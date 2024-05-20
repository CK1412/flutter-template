import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/bloc/common/common_bloc.dart';
import 'base_page_mixin.dart';
import 'loading_visible.dart';

class BaseCommonListener extends StatelessWidget with BasePageMixin {
  const BaseCommonListener({
    super.key,
    required this.builder,
  });

  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
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
    );
  }

  @override
  Widget buildPage(BuildContext context) {
    return builder.call(context);
  }
}
