import 'package:json_annotation/json_annotation.dart';

part 'user_info_data_model.g.dart';

@JsonSerializable()
class UserInfoDataModel {
  final int userId;
  final String token;
  final String userName;

  UserInfoDataModel({
    required this.userId,
    required this.token,
    required this.userName,
  });

  factory UserInfoDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoDataModelToJson(this);
}
