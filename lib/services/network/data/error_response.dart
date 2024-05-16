import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response.g.dart';
part 'error_response.freezed.dart';

@freezed
class ErrorResponse with _$ErrorResponse {
  const factory ErrorResponse({required int errorCode, String? errorMsg}) =
      _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}
