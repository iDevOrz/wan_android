import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wan_android/services/network/api_interface.dart';
import 'package:wan_android/services/network/api_service.dart';
import 'package:wan_android/services/network/dio_service.dart';
import 'package:wan_android/services/network/error_code_interceptor.dart';
import 'package:wan_android/services/storage/storage_config.dart';

part 'api_service_provider.g.dart';

const _baseUrl = String.fromEnvironment(
  'BASE_URL',
  defaultValue: 'https://www.wanandroid.com',
);

@Riverpod(keepAlive: true)
ApiInterface apiService(Ref ref) {
  return ApiService(
    DioService(
        dioClient: Dio(
          BaseOptions(baseUrl: _baseUrl),
        ),
        interceptors: [
          ErrorCodeInterceptor(),
          CookieManager(
            PersistCookieJar(
              storage: FileStorage(StorageConfig.tempDir.path),
            ),
          )
        ]),
  );
}
