import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/session/session_manager.dart';
import '../../../domain/entities/auth/user_info_entity.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../base/base_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@LazySingleton()
class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  AuthBloc(this._authRepository)
      : super(
          SessionManager.isLoggedIn
              ? AuthState.authenticated(SessionManager.userInfo!)
              : const AuthState.unauthenticated(),
        ) {
    on<_UserLoginChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onAppLogoutRequested);
    on<AppLoggedIn>(_onAppLoggedIn);
    on<AppSignedUp>(_onAppSignedUp);
  }

  final AuthRepository _authRepository;

  FutureOr<void> _onUserChanged(
    _UserLoginChanged event,
    Emitter<AuthState> emit,
  ) {
    emit(
      state.copyWith(
        authStatus: event.user != null
            ? AuthStatus.authenticated
            : AuthStatus.unauthenticated,
        userInfo: event.user,
      ),
    );
  }

  FutureOr<void> _onAppLogoutRequested(
    AppLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await _authRepository.logOut();
    add(const _UserLoginChanged(null));
  }

  FutureOr<void> _onAppLoggedIn(
    AppLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    final userInfo =
        await _authRepository.loginWithPassword('Canh Tran', 'canh@1234');
    if (userInfo != null) {
      add(_UserLoginChanged(userInfo));
    }
  }

  FutureOr<void> _onAppSignedUp(
    AppSignedUp event,
    Emitter<AuthState> emit,
  ) async {
    final userInfo = await _authRepository.signUp('Canh Tran', 'canh@1234');
    add(_UserLoginChanged(userInfo));
  }
}
