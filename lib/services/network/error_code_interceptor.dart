import 'package:dio/dio.dart';
import 'package:wan_android/services/network/data/error_response.dart';
import 'package:wan_android/services/network/typedefs.dart';

class ErrorCodeInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data is JSON && response.data["errorCode"] == 0) {
      super.onResponse(response, handler);
    } else {
      try {
        final errorResponse = ErrorResponse.fromJson(response.data);
        return handler.reject(
          DioException(
            requestOptions: response.requestOptions,
            response: response,
            error: errorResponse,
          ),
          true,
        );
      } catch (error) {
        return handler.reject(
          DioException(
            requestOptions: response.requestOptions,
            response: response,
            error: error,
          ),
          true,
        );
      }
    }
  }
}
