import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/api_user_data.dart';

part 'get_single_user_response.freezed.dart';

part 'get_single_user_response.g.dart';

@freezed
class GetSingleUserResponse with _$GetSingleUserResponse {
  const factory GetSingleUserResponse({
    @JsonKey(name: 'data') required ApiUserData data,
  }) = _GetSingleUserResponse;

  const GetSingleUserResponse._();

  factory GetSingleUserResponse.fromJson(Map<String, Object?> json) =>
      _$GetSingleUserResponseFromJson(json);
}
