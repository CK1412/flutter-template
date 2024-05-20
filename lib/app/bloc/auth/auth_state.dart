part of 'auth_bloc.dart';

final class AuthState extends BaseBlocState {
  const AuthState({
    required this.authStatus,
  });

  final AuthStatus authStatus;

  const AuthState.authenticated() : authStatus = AuthStatus.authenticated;

  const AuthState.unauthenticated() : authStatus = AuthStatus.unauthenticated;

  bool get isAuthenticated => authStatus == AuthStatus.authenticated;

  @override
  List<Object?> get props => [authStatus];

  AuthState copyWith({
    AuthStatus? authStatus,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
    );
  }
}

enum AuthStatus {
  authenticated,
  unauthenticated,
}
