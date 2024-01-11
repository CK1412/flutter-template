import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../api/rest_api_paths.dart';

part 'auth_app_rest_api_data_source.g.dart';

@RestApi()
abstract class AuthAppRestApiDataSource {
  factory AuthAppRestApiDataSource(
    Dio dio, {
    String baseUrl,
  }) = _AuthAppRestApiDataSource;

  @POST(AuthAppRestApiPaths.logout)
  Future<bool> logOut();
}
