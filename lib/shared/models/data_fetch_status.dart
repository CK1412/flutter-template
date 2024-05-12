enum DataFetchStatus {
  none,
  inProgress,
  refresh,
  success,
  failure,
  complete,
}

extension DataFetchStatusEx on DataFetchStatus {
  bool get isNone => this == DataFetchStatus.none;

  bool get isInProgress => this == DataFetchStatus.inProgress;

  bool get isSuccess => this == DataFetchStatus.success;

  bool get isFailure => this == DataFetchStatus.failure;

  bool get isRefresh => this == DataFetchStatus.refresh;

  bool get isComplete => this == DataFetchStatus.complete;
}
