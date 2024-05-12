import 'package:freezed_annotation/freezed_annotation.dart';

import '../user_api_model.dart';

part 'get_single_user_response.freezed.dart';

part 'get_single_user_response.g.dart';

@freezed
class GetSingleUserResponse with _$GetSingleUserResponse {
  const factory GetSingleUserResponse({
    @JsonKey(name: 'data') required UserApiModel data,
  }) = _GetSingleUserResponse;

  const GetSingleUserResponse._();

  factory GetSingleUserResponse.fromJson(Map<String, Object?> json) =>
      _$GetSingleUserResponseFromJson(json);
}
