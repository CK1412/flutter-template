import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_entity.freezed.dart';
part 'user_info_entity.g.dart';

@freezed
class UserInfoEntity with _$UserInfoEntity {
  const factory UserInfoEntity({
    required int userId,
    required String token,
    required String userName,
  }) = _UserInfoEntity;

  factory UserInfoEntity.fromJson(Map<String, Object?> json) =>
      _$UserInfoEntityFromJson(json);
}
