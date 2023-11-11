/// Utility functions for working with Future
library;

import 'dart:async';

import '../exceptions/app_exception.dart';

Future<void> handleRequest<T>({
  required FutureOr<T?> request,
  required Function(T data) onSuccess,
  Function(AppException appException)? onError,
  FutureOr<void> Function()? whenDataNull,
  FutureOr<void> Function()? whenComplete,
}) async {
  try {
    final T? response = await request;

    if (response != null) {
      await onSuccess.call(response);
    } else {
      await whenDataNull?.call();
    }
  } on AppException catch (e) {
    onError?.call(e);
  } catch (e) {
    onError?.call(AppException(message: e.toString()));
  } finally {
    await whenComplete?.call();
  }
}
