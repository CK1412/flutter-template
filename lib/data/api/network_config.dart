class NetworkConfig {
  NetworkConfig._();

  static const String contentType = "application/json";
  static const Duration sendTimeout = Duration(seconds: 30);
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 60);
}
