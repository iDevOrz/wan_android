import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiBaseResponse<T> {
  final T data;
  final int errorCode;
  final String errorMsg;

  factory ApiBaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ApiBaseResponseFromJson(json, fromJsonT);

  ApiBaseResponse(
      {required this.data, required this.errorCode, required this.errorMsg});
}
