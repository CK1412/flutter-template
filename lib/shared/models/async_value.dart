import 'package:freezed_annotation/freezed_annotation.dart';

part 'async_value.freezed.dart';

@Freezed(genericArgumentFactories: true)
sealed class AsyncValue<T> with _$AsyncValue<T> {
  const AsyncValue._();

  const factory AsyncValue.pure() = AsyncValuePure;

  const factory AsyncValue(T data) = AsyncValueData;

  const factory AsyncValue.inProgress([T? data]) = AsyncValueInProgress;

  const factory AsyncValue.success(T data) = AsyncValueSuccess;

  const factory AsyncValue.error(Object error, T? data) = AsyncValueError;

  T? getData() {
    return whenOrNull(
      (data) => data,
      pure: () => null,
      inProgress: (data) => data,
      error: (error, data) => data,
      success: (data) => data,
    );
  }
}
