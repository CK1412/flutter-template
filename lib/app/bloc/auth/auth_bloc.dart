import 'dart:async';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/session/session_manager.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../base/base_bloc.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@LazySingleton()
class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  AuthBloc(this._authRepository)
      : super(
          SessionManager.instance.isLoggedIn
              ? const AuthState.authenticated()
              : const AuthState.unauthenticated(),
        ) {
    on<AppLogoutRequested>(_onAppLogoutRequested);
    on<AppLoggedInRequested>(_onAppLoggedInRequested);
    on<AppSignedUpRequested>(_onAppSignedUpRequested);
  }

  final AuthRepository _authRepository;

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
          emit(const AuthState.unauthenticated());
          event.onSuccessCallback?.call();
        }
      },
    );
  }

  FutureOr<void> _onAppLoggedInRequested(
    AppLoggedInRequested event,
    Emitter<AuthState> emit,
  ) async {
    await handleBlocTask<bool>(
      action: () {
        return _authRepository.login(
          'eve.holt@reqres.in',
          'cityslicka',
        );
      },
      onSuccess: (bool success) {
        emit(const AuthState.authenticated());
        event.onSuccessCallback?.call();
      },
    );
  }

  FutureOr<void> _onAppSignedUpRequested(
    AppSignedUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    await handleBlocTask<bool>(
      action: () {
        return _authRepository.register(
          'eve.holt@reqres.in',
          'pistol',
        );
      },
      onSuccess: (bool success) {
        emit(const AuthState.authenticated());
        event.onSuccessCallback?.call();
      },
    );
  }
}
