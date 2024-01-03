import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/session/session_manager.dart';
import '../../../domain/entities/auth/auth_info_entity.dart';
import '../../../domain/repositories/auth_repository.dart';
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
    on<AppLoggedIn>(_onAppLoggedIn);
    on<AppSignedUp>(_onAppSignedUp);
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
    await _authRepository.logOut();
    add(const _AuthInfoChanged(null));
  }

  FutureOr<void> _onAppLoggedIn(
    AppLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    commonBloc.showLoading();
    final AuthInfoEntity? authInfo = await _authRepository.login(
      'eve.holt@reqres.in',
      'cityslicka',
    );
    add(_AuthInfoChanged(authInfo));
    commonBloc.hideLoading();
  }

  FutureOr<void> _onAppSignedUp(
    AppSignedUp event,
    Emitter<AuthState> emit,
  ) async {
    commonBloc.showLoading();
    final AuthInfoEntity? authInfo = await _authRepository.register(
      'eve.holt@reqres.in',
      'pistol',
    );
    add(_AuthInfoChanged(authInfo));
    commonBloc.hideLoading();
  }
}
