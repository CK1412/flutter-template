import '../logger/logger.dart';

mixin LogMixin on Object {
  void logD(String message, {DateTime? time}) {
    logger.d(message, time: time);
  }

  void logE(
    Object? errorMessage, {
    Object? error,
    StackTrace? stackTrace,
    DateTime? time,
  }) {
    logger.e(
      '❌ $errorMessage',
      error: error,
      stackTrace: stackTrace,
      time: time,
    );
  }
}
