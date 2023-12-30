import '../logger/logger.dart';

class ErrorHandler {
  ErrorHandler._();
  static ErrorHandler? _instance;

  factory ErrorHandler() {
    return _instance ??= ErrorHandler._();
  }

  void logError(String message, {Object? error, StackTrace? stackTrace}) {
    logger.e(message, error: error, stackTrace: stackTrace);
  }

  void reportError(Object error) {
    // This method used to log errors or send them to users via external services
    // such as Firebase Crashlytics or Sentry.
  }
}
