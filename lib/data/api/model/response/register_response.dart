import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_response.freezed.dart';

part 'register_response.g.dart';

@freezed
class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'token') required String token,
  }) = _RegisterResponse;

  const RegisterResponse._();

  factory RegisterResponse.fromJson(Map<String, Object?> json) =>
      _$RegisterResponseFromJson(json);
}
