# Data Model

## 📁 data

- Data model from Api.
- class naming convention: 'Api' + [object] + 'Data'.\
  E.g. ApiUserData
- Example:

```dart
/// File name: api_user_data.dart
/// 
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_user_data.freezed.dart';

part 'api_user_data.g.dart';

@freezed
class ApiUserData with _$ApiUserData {
  const factory ApiUserData({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String avatar,
  }) = _ApiUserData;

  const ApiUserData._();

  factory ApiUserData.fromJson(Map<String, Object?> json) =>
      _$ApiUserDataFromJson(json);
}
```

## 📁 request

- Request data for api method.
- class naming convention: [api_method] + 'Request'.\
  E.g. loginRequest
- Example:

```dart
/// File name: login_request.dart
/// 
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request.freezed.dart';

part 'login_request.g.dart';

@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'password') required String password,
  }) = _LoginRequest;

  const LoginRequest._();

  factory LoginRequest.fromJson(Map<String, Object?> json) =>
      _$LoginRequestFromJson(json);
}
```

## 📁 response

- Response data received from api.
- class naming convention: [api_method] + 'Response'.\
  E.g. LoginResponse
- Example:

```dart
/// File name: login_response.dart
/// 
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';

part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: 'token') required String token,
  }) = _LoginResponse;

  const LoginResponse._();

  factory LoginResponse.fromJson(Map<String, Object?> json) =>
      _$LoginResponseFromJson(json);
}
```
