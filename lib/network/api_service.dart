import 'package:dio/src/cancel_token.dart';
import 'package:wan_android/network/api_base_response.dart';
import 'package:wan_android/network/api_endpoint.dart';
import 'package:wan_android/network/api_interface.dart';
import 'package:wan_android/network/typedefs.dart';

import 'dio_service.dart';

class ApiService implements ApiInterface {
  /// An instance of [DioService] for network requests
  late final DioService _dioService;

  /// A public constructor that is used to initialize the API service
  /// and setup the underlying [_dioService].
  ApiService(DioService dioService) : _dioService = dioService;

  @override
  void cancelRequests({CancelToken? cancelToken}) {
    _dioService.cancelRequests(cancelToken: cancelToken);
  }

  @override
  Future<ApiBaseResponse<T>> getData<T>(
      {required ApiEndpoint endpoint,
      JSON? queryParams,
      CancelToken? cancelToken,
      required T Function(JSON responseData) converter}) async {
    final response = await _dioService.get(
        endpoint: endpoint.path,
        queryParams: queryParams,
        cancelToken: cancelToken);
    return ApiBaseResponse.fromJson(
        response, (json) => converter.call(json as JSON));
  }

  @override
  Future<ApiBaseResponse<List<T>>> getListData<T>(
      {required ApiEndpoint endpoint,
      JSON? queryParams,
      CancelToken? cancelToken,
      required T Function(JSON dataItemJson) dataItemConverter}) async {
    final response = await _dioService.get(
        endpoint: endpoint.path,
        queryParams: queryParams,
        cancelToken: cancelToken);
    return ApiBaseResponse.fromJson(
      response,
      (json) => (json as List<JSON>).map(dataItemConverter).toList(),
    );
  }

  @override
  Future<ApiBaseResponse<T>> postData<T>(
      {required ApiEndpoint endpoint,
      required JSON data,
      CancelToken? cancelToken,
      required T Function(JSON response) converter}) async {
    final response = await _dioService.post(
        endpoint: endpoint.path, data: data, cancelToken: cancelToken);
    return ApiBaseResponse.fromJson(
        response, (json) => converter.call(json as JSON));
  }
}
