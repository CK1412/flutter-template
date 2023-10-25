part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

final class _UserLoginChanged extends AuthEvent {
  final UserLoginModel? user;

  const _UserLoginChanged(this.user);
}

final class AppLogoutRequested extends AuthEvent {
  const AppLogoutRequested();
}

final class AppLoggedIn extends AuthEvent {
  const AppLoggedIn();
}

final class AppSignedUp extends AuthEvent {
  const AppSignedUp();
}
