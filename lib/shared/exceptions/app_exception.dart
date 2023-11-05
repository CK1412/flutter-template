import 'package:equatable/equatable.dart';

class AppException extends Equatable implements Exception {
  final String? message;
  final int timestamp;

  AppException(this.message) : timestamp = DateTime.now().millisecond;

  @override
  List<Object?> get props => [message, timestamp];
}
