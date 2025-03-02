import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../api/model/request/login_request.dart';
import '../../api/model/request/register_request.dart';
import '../../api/model/response/get_single_user_response.dart';
import '../../api/model/response/login_response.dart';
import '../../api/model/response/register_response.dart';
import '../../api/rest_api_path.dart';

part 'rest_api_data_source.g.dart';

@RestApi()
abstract class RestApiDataSource {
  factory RestApiDataSource(
    Dio dio, {
    String baseUrl,
  }) = _RestApiDataSource;

  @POST(RestApiPath.register)
  Future<RegisterResponse> register(@Body() RegisterRequest request);

  @POST(RestApiPath.login)
  Future<LoginResponse> login(@Body() LoginRequest request);

  @POST(RestApiPath.logout)
  Future<bool> logOut();

  @GET('${RestApiPath.users}/{id}')
  Future<GetSingleUserResponse> getSingleUser(@Path('id') int id);
}
