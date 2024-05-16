import 'package:dio/dio.dart' show CancelToken;
import 'package:wan_android/services/network/data/base_pagination_data.dart';
import 'package:wan_android/services/network/network_exception.dart';

import 'data/api_base_response.dart';
import 'api_interface.dart';
import 'dio_service.dart';
import 'typedefs.dart';

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
      {required String path,
      JSON? queryParams,
      CancelToken? cancelToken,
      required T Function(JSON responseData) converter}) async {
    try {
      final response = await _dioService.get(
        path: path,
        queryParams: queryParams,
        cancelToken: cancelToken,
      );
      return ApiBaseResponse.fromJson(
          response, (json) => converter.call(json as JSON));
    } on Exception catch (error) {
      throw NetworkException.getDioException(error);
    }
  }

  @override
  Future<ApiBaseResponse<List<T>>> getListData<T>(
      {required String path,
      JSON? queryParams,
      CancelToken? cancelToken,
      required T Function(JSON dataItemJson) dataItemConverter}) async {
    try {
      final response = await _dioService.get(
        path: path,
        queryParams: queryParams,
        cancelToken: cancelToken,
      );
      return ApiBaseResponse.fromJson(
        response,
        (json) => (json as List)
            .map(
              (e) => dataItemConverter(e as JSON),
            )
            .toList(),
      );
    } on Exception catch (error) {
      throw NetworkException.getDioException(error);
    }
  }

  @override
  Future<ApiBaseResponse<T>> postData<T>(
      {required String path,
      required JSON data,
      CancelToken? cancelToken,
      required T Function(JSON response) converter}) async {
    try {
      final response = await _dioService.post(
          path: path, data: data, cancelToken: cancelToken);
      return ApiBaseResponse.fromJson(
          response, (json) => converter.call(json as JSON));
    } on Exception catch (error) {
      throw NetworkException.getDioException(error);
    }
  }

  @override
  Future<ApiBaseResponse<BasePaginationData<T>>> getPaginationData<T>(
      {required String path,
      JSON? queryParams,
      CancelToken? cancelToken,
      required T Function(JSON itemJson) paginationItemConverter}) {
    try {
      return getData(
        path: path,
        queryParams: queryParams,
        cancelToken: cancelToken,
        converter: (json) => BasePaginationData.fromJson(
          json,
          (json) => paginationItemConverter.call(json as JSON),
        ),
      );
    } on Exception catch (error) {
      throw NetworkException.getDioException(error);
    }
  }
}
