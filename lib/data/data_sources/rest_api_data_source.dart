import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../api/rest_api_paths.dart';
import '../models/api/request/login_request.dart';
import '../models/api/request/register_request.dart';
import '../models/api/response/get_single_user_response.dart';
import '../models/api/response/login_response.dart';
import '../models/api/response/register_response.dart';

part 'rest_api_data_source.g.dart';

@RestApi()
abstract class RestApiDataSource {
  factory RestApiDataSource(
    Dio dio, {
    String baseUrl,
  }) = _RestApiDataSource;

  @POST(RestApiPaths.register)
  Future<RegisterResponse> register(@Body() RegisterRequest request);

  @POST(RestApiPaths.login)
  Future<LoginResponse> login(@Body() LoginRequest request);

  @POST(RestApiPaths.logout)
  Future<bool> logOut();

  @GET('${RestApiPaths.users}/{id}')
  Future<GetSingleUserResponse> getSingleUser(@Path('id') int id);
}
