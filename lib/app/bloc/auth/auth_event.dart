part of 'auth_bloc.dart';

sealed class AuthEvent extends BaseBlocEvent {
  const AuthEvent();
}

final class _AuthInfoChanged extends AuthEvent {
  final AuthInfoEntity? authInfo;

  const _AuthInfoChanged(this.authInfo);
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
