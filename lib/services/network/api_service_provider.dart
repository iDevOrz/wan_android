import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wan_android/services/network/api_interface.dart';
import 'package:wan_android/services/network/api_service.dart';
import 'package:wan_android/services/network/dio_service.dart';

part 'api_service_provider.g.dart';

const _baseUrl = String.fromEnvironment(
  'BASE_URL',
  defaultValue: 'https://www.wanandroid.com',
);
@riverpod
ApiInterface apiService(ApiServiceRef ref) {
  return ApiService(
    DioService(
        dioClient: Dio(
          BaseOptions(baseUrl: _baseUrl),
        ),
        interceptors: [
          LogInterceptor(
            responseBody: !kReleaseMode,
            requestBody: !kReleaseMode,
          )
        ]),
  );
}
