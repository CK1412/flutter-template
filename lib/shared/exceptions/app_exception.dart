class AppException implements Exception {
  final String? message;
  final String? messageCode;

  const AppException({this.message, this.messageCode});
}
