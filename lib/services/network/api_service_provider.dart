import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:wan_android/main.dart';
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
ApiInterface apiService(ApiServiceRef ref) {
  return ApiService(
    DioService(
        dioClient: Dio(
          BaseOptions(baseUrl: _baseUrl),
        ),
        interceptors: [
          TalkerDioLogger(
            talker: talker,
            settings: const TalkerDioLoggerSettings(
              printRequestHeaders: true,
              printResponseHeaders: true,
              printResponseMessage: true,
            ),
          ),
          ErrorCodeInterceptor(),
          CookieManager(
            PersistCookieJar(
              storage: FileStorage(StorageConfig.tempDir.path),
            ),
          )
        ]),
  );
}
