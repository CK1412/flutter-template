import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_api_data.freezed.dart';

part 'user_api_data.g.dart';

@freezed
class UserApiData with _$UserApiData {
  const factory UserApiData({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String avatar,
  }) = _UserApiData;

  const UserApiData._();

  factory UserApiData.fromJson(Map<String, Object?> json) =>
      _$UserApiDataFromJson(json);
}
