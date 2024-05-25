import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wan_android/services/network/data/error_response.dart';

part 'network_exception.freezed.dart';

@freezed
class NetworkException with _$NetworkException {
  const factory NetworkException.needLogin({String? errorMsg}) =
      _NetworkExceptionNeedLogin;

  const factory NetworkException.formatException() = _FormatException;

  const factory NetworkException.unrecognizedException(Exception error) =
      _UnrecognizedException;

  const factory NetworkException.apiException({
    required int errorCode,
    String? errorMsg,
  }) = _ApiException;

  const factory NetworkException.cancelException() = _CancelException;

  const factory NetworkException.connectTimeoutException() =
      _ConnectTimeoutException;

  const factory NetworkException.receiveTimeoutException() =
      _ReceiveTimeoutException;

  const factory NetworkException.sendTimeoutException() = _SendTimeoutException;

  const factory NetworkException.badCertificateException() =
      _BadCertificateException;

  const factory NetworkException.badResponseException() = _BadResponseException;

  const factory NetworkException.connectionErrorException() =
      _ConnectionErrorException;

  static NetworkException getDioException(Exception error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return const NetworkException.connectTimeoutException();
        case DioExceptionType.sendTimeout:
          return const NetworkException.sendTimeoutException();
        case DioExceptionType.receiveTimeout:
          return const NetworkException.receiveTimeoutException();
        case DioExceptionType.badCertificate:
          return const NetworkException.badCertificateException();
        case DioExceptionType.badResponse:
          return const NetworkException.badResponseException();
        case DioExceptionType.cancel:
          return const NetworkException.cancelException();
        case DioExceptionType.connectionError:
          return const NetworkException.connectionErrorException();
        case DioExceptionType.unknown:

          /// errorCode = -1001 代表登录失效，需要重新登录。
          if (error.error is ErrorResponse) {
            final errorResponse = error.error as ErrorResponse;
            if (errorResponse.errorCode == -1001) {
              return NetworkException.needLogin(
                  errorMsg: errorResponse.errorMsg);
            } else {
              return NetworkException.apiException(
                  errorCode: errorResponse.errorCode,
                  errorMsg: errorResponse.errorMsg);
            }
          } else {
            return NetworkException.unrecognizedException(error);
          }
      }
    } else if (error is FormatException) {
      return const NetworkException.formatException();
    } else {
      return NetworkException.unrecognizedException(error);
    }
  }
}
