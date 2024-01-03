part of 'auth_bloc.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
}

final class AuthState extends BaseBlocState {
  const AuthState({
    required this.authStatus,
    this.authInfo,
  });

  final AuthStatus authStatus;
  final AuthInfoEntity? authInfo;

  const AuthState.authenticated(AuthInfoEntity authInfo)
      : this(
          authStatus: AuthStatus.authenticated,
          authInfo: authInfo,
        );

  const AuthState.unauthenticated()
      : this(authStatus: AuthStatus.unauthenticated);

  bool get isAuthenticated => authStatus == AuthStatus.authenticated;

  @override
  List<Object?> get props => [authStatus, authInfo];

  AuthState copyWith({
    AuthStatus? authStatus,
    AuthInfoEntity? authInfo,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      authInfo: authInfo ?? this.authInfo,
    );
  }
}
