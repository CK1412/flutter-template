part of 'home_bloc.dart';

class HomeState extends Equatable {
  final BlocStatus blocStatus;

  final int count;
  final int tabIndex;

  const HomeState({
    this.blocStatus = BlocStatus.success,
    this.count = 0,
    this.tabIndex = 0,
  });

  @override
  List<Object?> get props => [blocStatus, count, tabIndex];

  HomeState copyWith({
    BlocStatus? blocStatus,
    int? count,
    int? tabIndex,
  }) {
    return HomeState(
      blocStatus: blocStatus ?? this.blocStatus,
      count: count ?? this.count,
      tabIndex: tabIndex ?? this.tabIndex,
    );
  }
}
