/// Utility functions for working with uri.
class UriUtils {
  UriUtils._();

  /// For example:
  ///
  /// ```dart
  /// String path = replacePathParameters('/home/:tab', {'tab' : '1'});
  /// ```
  /// The value for `path` would be `/home/1`.
  static String replacePathParameters(
    String path,
    Map<String, String> pathParameters,
  ) {
    String newPath = path;
    pathParameters.forEach((param, value) {
      newPath = newPath.replaceAll(':$param', value);
    });
    return newPath;
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
