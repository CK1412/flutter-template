class AppException implements Exception {
  final String? message;
  final String? messageCode;

  const AppException({this.message, this.messageCode});

  @override
  String toString() {
    return 'AppException{message: $message, messageCode: $messageCode}';
  }
}
