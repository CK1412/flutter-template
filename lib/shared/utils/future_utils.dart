/// Utility functions for working with Future
library;

import 'dart:async';

import '../exceptions/app_exception.dart';

Future<void> handleRequest<T>({
  required FutureOr<T?> Function() request,
  required Function(T data) onSuccess,
  Function(AppException appException)? onError,
  FutureOr<void> Function()? whenDataNull,
  FutureOr<void> Function()? whenComplete,
}) async {
  try {
    final T? response = await request.call();

    if (response != null) {
      await onSuccess.call(response);
    } else {
      await whenDataNull?.call();
    }
  } on AppException catch (e) {
    await onError?.call(e);
  } catch (e) {
    await onError?.call(AppException(message: e.toString()));
  } finally {
    await whenComplete?.call();
  }
}
