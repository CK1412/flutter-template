import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_template/data/models/user_login_model.dart';
import 'package:flutter_web_template/data/session/session_manager.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc()
      : super(SessionManager.isLoggedIn
            ? AuthState.authenticated(SessionManager.userLoginInfo!)
            : const AuthState.unauthenticated()) {
    on<_UserLoginChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onAppLogoutRequested);
    on<AppLoggedIn>(_onAppLoggedIn);
    on<AppSignedUp>(_onAppSignedUp);
  }

  FutureOr<void> _onUserChanged(
    _UserLoginChanged event,
    Emitter<AuthState> emit,
  ) {
    SessionManager.userLoginInfo = event.user;
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
    SessionManager.clear(message: "User log out");
    add(const _UserLoginChanged(null));
  }

  FutureOr<void> _onAppLoggedIn(
    AppLoggedIn event,
    Emitter<AuthState> emit,
  ) {
    final userInfo = UserLoginModel(
      userId: 1,
      token: 'token1',
      userName: 'user login',
    );
    add(_UserLoginChanged(userInfo));
  }

  FutureOr<void> _onAppSignedUp(
    AppSignedUp event,
    Emitter<AuthState> emit,
  ) {
    final userInfo = UserLoginModel(
      userId: 1,
      token: 'token1',
      userName: 'user sign up',
    );
    add(_UserLoginChanged(userInfo));
  }
}
