import 'package:dio/dio.dart';

abstract class BaseInterceptor extends InterceptorsWrapper {
  static const customLogPriority = 1;
  static const cacheRequestPriority = 20;
  static const accessTokenPriority = 30;
  static const refreshTokenPriority = 40;
  static const errorPriority = 50;
  static const retryOnErrorPriority = 90;
  static const connectivityPriority = 100;

  /// The higher the value, the higher the priority
  /// priority higher, add first
  /// priority lower, add last
  int get priority;
}
