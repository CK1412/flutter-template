part of 'home_bloc.dart';

class HomeState extends BaseBlocState {
  final BlocStatus blocStatus;

  final int count;
  final int tabIndex;
  final UserEntity? user;

  const HomeState({
    this.blocStatus = BlocStatus.success,
    this.count = 0,
    this.tabIndex = 0,
    this.user,
  });

  @override
  List<Object?> get props => [blocStatus, count, tabIndex, user];

  HomeState copyWith({
    BlocStatus? blocStatus,
    int? count,
    int? tabIndex,
    UserEntity? user,
  }) {
    return HomeState(
      blocStatus: blocStatus ?? this.blocStatus,
      count: count ?? this.count,
      tabIndex: tabIndex ?? this.tabIndex,
      user: user ?? this.user,
    );
  }
}
