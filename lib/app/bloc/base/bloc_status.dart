enum BlocStatus {
  initial,
  loading,
  waiting,
  success,
  completed,
  failure,
}

extension BlocStatusEx on BlocStatus {
  bool get isInitial => this == BlocStatus.initial;

  bool get isLoading => this == BlocStatus.loading;

  bool get isWaiting => this == BlocStatus.waiting;

  bool get isSuccess => this == BlocStatus.success;

  bool get isCompleted => this == BlocStatus.completed;

  bool get isFailure => this == BlocStatus.failure;
}
