import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_local_data.freezed.dart';

part 'user_local_data.g.dart';

@freezed
class UserLocalData with _$UserLocalData {
  const factory UserLocalData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'avatar') String? avatar,
  }) = _UserLocalData;

  const UserLocalData._();

  factory UserLocalData.fromJson(Map<String, Object?> json) =>
      _$UserLocalDataFromJson(json);
}
