part of 'home_bloc.dart';

class HomeState extends Equatable {
  final BlocStatus blocStatus;
  final int count;

  const HomeState({
    this.blocStatus = BlocStatus.success,
    this.count = 0,
  });

  @override
  List<Object> get props => [blocStatus, count];

  HomeState copyWith({
    BlocStatus? blocStatus,
    int? count,
  }) {
    return HomeState(
      blocStatus: blocStatus ?? this.blocStatus,
      count: count ?? this.count,
    );
  }
}
