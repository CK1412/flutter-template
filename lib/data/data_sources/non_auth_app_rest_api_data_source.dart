import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../api/rest_api_paths.dart';
import '../models/api/request/login_request.dart';
import '../models/api/request/register_request.dart';
import '../models/api/response/get_single_user_response.dart';
import '../models/api/response/login_response.dart';
import '../models/api/response/register_response.dart';

part 'non_auth_app_rest_api_data_source.g.dart';

@RestApi()
abstract class NonAuthAppRestApiDataSource {
  factory NonAuthAppRestApiDataSource(
    Dio dio, {
    String baseUrl,
  }) = _NonAuthAppRestApiDataSource;

  @POST(NonAuthAppRestApiPaths.register)
  Future<RegisterResponse> register(@Body() RegisterRequest request);

  @POST(NonAuthAppRestApiPaths.login)
  Future<LoginResponse> login(@Body() LoginRequest request);

  @GET('${NonAuthAppRestApiPaths.users}/{id}')
  Future<GetSingleUserResponse> getSingleUser(@Path('id') int id);
}
