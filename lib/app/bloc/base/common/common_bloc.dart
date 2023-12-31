import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../shared/exceptions/app_exception_wrapper.dart';
import '../../../../shared/extensions/number_extension.dart';
import '../base_bloc.dart';
import '../bloc_message.dart';

part 'common_event.dart';
part 'common_state.dart';

@Injectable()
class CommonBloc extends BaseBloc<CommonEvent, CommonState> {
  CommonBloc() : super(const CommonState()) {
    on<LoadingVisibilityEmitted>(_onLoadingVisibilityEmitted);
    on<ExceptionEmitted>(_onExceptionEmitted);
    on<BlocMessageEmitted>(_onBlocMessageEmitted);
  }

  FutureOr<void> _onLoadingVisibilityEmitted(
    LoadingVisibilityEmitted event,
    Emitter<CommonState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: event.isLoading,
        loadingCount: event.isLoading
            ? state.loadingCount.plus(1)
            : state.loadingCount.minus(1),
      ),
    );
  }

  FutureOr<void> _onExceptionEmitted(
    ExceptionEmitted event,
    Emitter<CommonState> emit,
  ) {
    emit(state.copyWith(appExceptionWrapper: event.appExceptionWrapper));
  }

  FutureOr<void> _onBlocMessageEmitted(
    BlocMessageEmitted event,
    Emitter<CommonState> emit,
  ) {
    emit(state.copyWith(blocMessage: event.blocMessage));
  }
}
