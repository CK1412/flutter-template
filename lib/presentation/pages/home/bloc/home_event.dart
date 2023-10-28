part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class InitialData extends HomeEvent {
  final int? tabIndex;

  InitialData({this.tabIndex});
}

class CountIncreased extends HomeEvent {
  CountIncreased();
}

class TabIndexChanged extends HomeEvent {
  final int value;

  TabIndexChanged(this.value);
}
