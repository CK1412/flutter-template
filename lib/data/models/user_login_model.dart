import 'package:json_annotation/json_annotation.dart';

part 'user_login_model.g.dart';

@JsonSerializable(createToJson: false)
class UserLoginModel {
  final int userId;
  final String token;

  UserLoginModel(this.userId, this.token);

  factory UserLoginModel.fromJson(Map<String, dynamic> json) =>
      _$UserLoginModelFromJson(json);
}
