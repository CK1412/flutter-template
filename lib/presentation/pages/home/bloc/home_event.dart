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

class LoggedInUserInformationFetched extends HomeEvent {
  const LoggedInUserInformationFetched();
}
