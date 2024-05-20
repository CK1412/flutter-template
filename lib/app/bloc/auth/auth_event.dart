part of 'auth_bloc.dart';

sealed class AuthEvent extends BaseBlocEvent {
  const AuthEvent();
}

final class AppLogoutRequested extends AuthEvent {
  final VoidCallback? onSuccessCallback;

  const AppLogoutRequested({this.onSuccessCallback});
}

final class AppLoggedInRequested extends AuthEvent {
  final VoidCallback? onSuccessCallback;

  const AppLoggedInRequested({this.onSuccessCallback});
}

final class AppSignedUpRequested extends AuthEvent {
  final VoidCallback? onSuccessCallback;

  const AppSignedUpRequested({this.onSuccessCallback});
}
