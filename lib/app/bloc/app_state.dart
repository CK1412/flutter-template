part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState();

  bool get isLoggedIn => SessionManager.isLoggedIn;

  @override
  List<Object> get props => [];
}
