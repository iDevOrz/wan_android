import 'package:dio/dio.dart';

import 'api_base_response.dart';
import 'api_endpoint.dart';
import 'typedefs.dart';

abstract interface class ApiInterface {
  Future<ApiBaseResponse<T>> getData<T>({
    required ApiEndpoint endpoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    required T Function(JSON responseData) converter,
  });

  Future<ApiBaseResponse<List<T>>> getListData<T>({
    required ApiEndpoint endpoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    required T Function(JSON responseBody) dataItemConverter,
  });

  Future<ApiBaseResponse<T>> postData<T>({
    required ApiEndpoint endpoint,
    required JSON data,
    CancelToken? cancelToken,
    required T Function(JSON response) converter,
  });

  void cancelRequests({CancelToken? cancelToken});
}
