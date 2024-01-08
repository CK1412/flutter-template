import 'package:dio/dio.dart';

abstract class BaseInterceptor extends InterceptorsWrapper {
  static const customLogPriority = 1;
  static const cacheRequestPriority = 2;

  /// The higher the value, the higher the priority
  /// priority higher, add first
  /// priority lower, add last
  int get priority;
}
