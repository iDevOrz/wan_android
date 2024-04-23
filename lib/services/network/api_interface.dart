import 'package:dio/dio.dart';
import 'package:wan_android/services/network/data/base_pagination_data.dart';

import 'data/api_base_response.dart';
import 'typedefs.dart';

abstract interface class ApiInterface {
  Future<ApiBaseResponse<T>> getData<T>({
    required String path,
    JSON? queryParams,
    CancelToken? cancelToken,
    required T Function(JSON responseData) converter,
  });

  Future<ApiBaseResponse<List<T>>> getListData<T>({
    required String path,
    JSON? queryParams,
    CancelToken? cancelToken,
    required T Function(JSON dataItemJson) dataItemConverter,
  });

  Future<ApiBaseResponse<BasePaginationData<T>>> getPaginationData<T>({
    required String path,
    JSON? queryParams,
    CancelToken? cancelToken,
    required T Function(JSON itemJson) paginationItemConverter,
  });

  Future<ApiBaseResponse<T>> postData<T>({
    required String path,
    required JSON data,
    CancelToken? cancelToken,
    required T Function(JSON response) converter,
  });

  void cancelRequests({CancelToken? cancelToken});
}
