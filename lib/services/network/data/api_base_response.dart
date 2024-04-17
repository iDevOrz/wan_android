import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_base_response.g.dart';
part 'api_base_response.freezed.dart';

@freezed
@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class ApiBaseResponse<T> with _$ApiBaseResponse<T> {
  const factory ApiBaseResponse(
      {required T data,
      required int errorCode,
      required String errorMsg}) = _ApiBaseResponse<T>;

  factory ApiBaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$ApiBaseResponseFromJson<T>(json, fromJsonT);
  }
}
