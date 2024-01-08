import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/bloc/base/base_bloc.dart';
import '../../../../app/bloc/base/bloc_status.dart';
import '../../../../data/session/session_manager.dart';
import '../../../../domain/entities/user/user_entity.dart';
import '../../../../domain/repositories/user_repository.dart';
import '../../../../l10n/generated/l10n.dart';
import '../../../../shared/exceptions/app_exception_wrapper.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc(this._userRepository) : super(const HomeState()) {
    on<InitialData>(_onInitialData);
    on<CountIncreased>(_onCountIncreased, transformer: droppable());
    on<TabIndexChanged>(_onTabIndexChanged);
    on<LoggedInUserInformationFetched>(_onLoggedInUserInformationFetched);
  }

  final UserRepository _userRepository;

  FutureOr<void> _onInitialData(
    InitialData event,
    Emitter<HomeState> emit,
  ) {
    // init data state
    emit(state.copyWith(tabIndex: event.tabIndex));
  }

  FutureOr<void> _onCountIncreased(
    CountIncreased event,
    Emitter<HomeState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(count: state.count + 1));
  }

  FutureOr<void> _onTabIndexChanged(
    TabIndexChanged event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(tabIndex: event.value));
  }

  FutureOr<void> _onLoggedInUserInformationFetched(
    LoggedInUserInformationFetched event,
    Emitter<HomeState> emit,
  ) async {
    final int? loggedInUserId = SessionManager.userId;

    if (loggedInUserId != null) {
      await handleBlocTask<UserEntity>(
        action: () => _userRepository.getSingleUser(loggedInUserId),
        onSuccess: (user) {
          emit(state.copyWith(user: user));
        },
        overrideErrorMessage: L.current.errorCommonExceptionMessage,
        errorDisplayStyle: ExceptionDisplayStyle.dialog,
        onRetry: () {
          add(event);
        },
      );
    }
  }
}
