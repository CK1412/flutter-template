class UriUtil {
  UriUtil._();

  static String replacePathParameters(
    String path,
    Map<String, String> pathParameters,
  ) {
    pathParameters.forEach((param, value) {
      path = path.replaceAll(':$param', value);
    });
    return path;
  }

  static Uri createUri({
    required String path,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
  }) {
    final pathWithPathParams = replacePathParameters(path, pathParameters);

    return Uri(
      path: pathWithPathParams,
      queryParameters: queryParameters,
    );
  }
}
