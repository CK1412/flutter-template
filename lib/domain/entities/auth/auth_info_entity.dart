import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_info_entity.freezed.dart';
part 'auth_info_entity.g.dart';

@freezed
class AuthInfoEntity with _$AuthInfoEntity {
  const factory AuthInfoEntity({
    int? id,
    required String token,
  }) = _AuthInfoEntity;

  factory AuthInfoEntity.fromJson(Map<String, Object?> json) =>
      _$AuthInfoEntityFromJson(json);
}
