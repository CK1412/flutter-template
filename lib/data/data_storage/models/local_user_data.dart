import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_user_data.freezed.dart';

part 'local_user_data.g.dart';

@freezed
class LocalUserData with _$LocalUserData {
  const factory LocalUserData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'avatar') String? avatar,
  }) = _LocalUserData;

  const LocalUserData._();

  factory LocalUserData.fromJson(Map<String, Object?> json) =>
      _$LocalUserDataFromJson(json);
}
