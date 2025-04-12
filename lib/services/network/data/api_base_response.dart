import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_base_response.freezed.dart';
part 'api_base_response.g.dart';

@freezed
abstract class ApiBaseResponse<T> with _$ApiBaseResponse<T> {
  @JsonSerializable(genericArgumentFactories: true, createToJson: false)
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
