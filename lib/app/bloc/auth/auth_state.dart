part of 'auth_bloc.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
}

final class AuthState extends Equatable {
  const AuthState({
    required this.authStatus,
    this.userInfo,
  });

  final AuthStatus authStatus;
  final UserLoginModel? userInfo;

  const AuthState.authenticated(UserLoginModel userLoginInfo)
      : this(
          authStatus: AuthStatus.authenticated,
          userInfo: userLoginInfo,
        );

  const AuthState.unauthenticated()
      : this(authStatus: AuthStatus.unauthenticated);

  bool get isAuthenticated => authStatus == AuthStatus.authenticated;

  @override
  List<Object?> get props => [authStatus, userInfo];

  AuthState copyWith({
    AuthStatus? authStatus,
    UserLoginModel? userInfo,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      userInfo: userInfo ?? this.userInfo,
    );
  }
}
