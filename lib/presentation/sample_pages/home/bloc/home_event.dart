part of 'home_bloc.dart';

abstract class HomeEvent extends BaseBlocEvent {
  const HomeEvent();
}

class InitialData extends HomeEvent {
  final int? tabIndex;

  const InitialData({this.tabIndex});
}

class CountIncreased extends HomeEvent {
  const CountIncreased();
}

class TabIndexChanged extends HomeEvent {
  final int value;

  const TabIndexChanged(this.value);
}

class UserInfoFetched extends HomeEvent {
  final VoidCallback onSuccessCallback;
  final int? userId;

  const UserInfoFetched({
    this.userId,
    required this.onSuccessCallback,
  });
}
