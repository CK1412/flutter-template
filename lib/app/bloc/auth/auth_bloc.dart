import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/auth/auth_info_entity.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../session/session_manager.dart';
import '../base/base_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@LazySingleton()
class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  AuthBloc(this._authRepository)
      : super(
          SessionManager.isLoggedIn
              ? AuthState.authenticated(SessionManager.authInfo!)
              : const AuthState.unauthenticated(),
        ) {
    on<_AuthInfoChanged>(_onAuthInfoChanged);
    on<AppLogoutRequested>(_onAppLogoutRequested);
    on<AppLoggedInRequested>(_onAppLoggedInRequested);
    on<AppSignedUpRequested>(_onAppSignedUpRequested);
  }

  final AuthRepository _authRepository;

  FutureOr<void> _onAuthInfoChanged(
    _AuthInfoChanged event,
    Emitter<AuthState> emit,
  ) {
    emit(
      state.copyWith(
        authStatus: event.authInfo != null
            ? AuthStatus.authenticated
            : AuthStatus.unauthenticated,
        authInfo: event.authInfo,
      ),
    );
  }

  FutureOr<void> _onAppLogoutRequested(
    AppLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await handleBlocTask<bool>(
      action: () {
        return _authRepository.logOut();
      },
      onSuccess: (bool success) {
        if (success) {
          add(const _AuthInfoChanged(null));
        }
      },
    );
  }

  FutureOr<void> _onAppLoggedInRequested(
    AppLoggedInRequested event,
    Emitter<AuthState> emit,
  ) async {
    await handleBlocTask<AuthInfoEntity>(
      action: () {
        return _authRepository.login(
          'eve.holt@reqres.in',
          'cityslicka',
        );
      },
      onSuccess: (AuthInfoEntity authInfo) {
        add(_AuthInfoChanged(authInfo));
      },
    );
  }

  FutureOr<void> _onAppSignedUpRequested(
    AppSignedUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    await handleBlocTask<AuthInfoEntity>(
      action: () {
        return _authRepository.register(
          'eve.holt@reqres.in',
          'pistol',
        );
      },
      onSuccess: (AuthInfoEntity authInfo) {
        add(_AuthInfoChanged(authInfo));
      },
    );
  }
}
