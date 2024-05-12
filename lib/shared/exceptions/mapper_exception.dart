class MapperException<From, To> implements Exception {
  final Exception error;

  const MapperException(this.error);

  String get errorMessage => error.toString();

  @override
  String toString() {
    return 'Error when mapping class $From to $To: $errorMessage}';
  }
}
