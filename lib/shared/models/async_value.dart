import 'package:flutter/widgets.dart';

import 'data_fetch_status.dart';

class AsyncValue<T> {
  final DataFetchStatus status;
  final T? data;
  final Object? error;

  const AsyncValue._(this.status, this.data, this.error);

  const AsyncValue.nothing() : this._(DataFetchStatus.none, null, null);

  const AsyncValue.inProgress([T? data])
      : this._(DataFetchStatus.inProgress, data, null);

  const AsyncValue.refreshing([T? data])
      : this._(DataFetchStatus.refresh, data, null);

  const AsyncValue.success(T data)
      : this._(DataFetchStatus.success, data, null);

  const AsyncValue.withData(DataFetchStatus callStatus, T data)
      : this._(callStatus, data, null);

  const AsyncValue.withError(Object error, T? data)
      : this._(DataFetchStatus.failure, data, error);

  bool get hasData => data != null;

  bool get hasError => error != null;

  bool get loadingData => status.isInProgress || status.isRefresh;

  bool get needRefreshData => !hasData || hasError;

  Widget when({
    required Widget Function(T data) onData,
    required Widget Function(Object error) onError,
    Widget Function()? onLoading,
    Widget Function()? orDefault,
  }) {
    if (onLoading != null && loadingData) {
      return onLoading.call();
    } else if (hasData) {
      return onData.call(data as T);
    } else if (hasError) {
      return onError.call(error!);
    }
    return orDefault?.call() ?? const SizedBox.shrink();
  }

  @override
  String toString() {
    return 'AsyncValue{callStatus: $status, data: $data, error: $error}';
  }
}
