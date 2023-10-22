part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class InitialData extends HomeEvent {
  InitialData();
}

class CountIncreased extends HomeEvent {
  CountIncreased();
}
