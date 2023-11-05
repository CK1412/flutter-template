import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/exceptions/app_exception.dart';
import '../../../shared/logger/logger.dart';
import 'common/common_bloc.dart';

part 'base_bloc_event.dart';
part 'base_bloc_state.dart';

abstract class BaseBloc<E extends BaseBlocEvent, S extends BaseBlocState>
    extends BaseBlocDelegate<E, S> {
  BaseBloc(super.initialState);
}

abstract class BaseBlocDelegate<E extends BaseBlocEvent,
    S extends BaseBlocState> extends Bloc<E, S> {
  BaseBlocDelegate(super.initialState);

  late final CommonBloc _commonBloc;

  set commonBloc(CommonBloc commonBloc) {
    _commonBloc = commonBloc;
  }

  CommonBloc get commonBloc =>
      this is CommonBloc ? this as CommonBloc : _commonBloc;

  @override
  void add(E event) {
    if (!isClosed) {
      super.add(event);
    } else {
      logger.w('Cannot add new event $event because $runtimeType was closed');
    }
  }

  void showLoading() {
    commonBloc.add(LoadingVisibilityEmitted(isLoading: true));
  }

  void hideLoading() {
    commonBloc.add(LoadingVisibilityEmitted(isLoading: false));
  }

  void addException(AppException exception) {
    commonBloc.add(ExceptionEmitted(exception));
  }
}
