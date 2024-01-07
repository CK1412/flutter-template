import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../api/api_paths.dart';
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

  @POST(ApiPaths.register)
  Future<RegisterResponse> register(@Body() RegisterRequest request);

  @POST(ApiPaths.login)
  Future<LoginResponse> login(@Body() LoginRequest request);

  @POST(ApiPaths.logout)
  Future<bool> logOut();

  @GET('${ApiPaths.users}/{id}')
  Future<GetSingleUserResponse> getSingleUser(@Path('id') int id);
}
