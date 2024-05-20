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
