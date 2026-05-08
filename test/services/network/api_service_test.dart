import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wan_android/services/network/api_service.dart';
import 'package:wan_android/services/network/data/api_base_response.dart';
import 'package:wan_android/services/network/dio_service.dart';
import 'package:wan_android/services/network/network_exception.dart';

class MockDioService extends Mock implements DioService {}

class MockCancelToken extends Mock implements CancelToken {}

void main() {
  late DioService mockDioService;
  late ApiService apiService;

  setUp(() {
    mockDioService = MockDioService();
    apiService = ApiService(mockDioService);
  });

  group('ApiService', () {
    const tPath = '/test/path';
    const tData = {'key': 'value'};
    const tResponseData = {'data': tData, 'errorCode': 0, 'errorMsg': ''};

    test('getData calls DioService.get and returns parsed data', () async {
      // Arrange
      when(
        () => mockDioService.get(
          path: any(named: 'path'),
          queryParams: any(named: 'queryParams'),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).thenAnswer((_) async => tResponseData);

      // Act
      final result = await apiService.getData(
        path: tPath,
        converter: (json) => json,
      );

      // Assert
      expect(result, isA<ApiBaseResponse>());
      expect(result.data, tData);
      verify(() => mockDioService.get(path: tPath)).called(1);
    });

    test('getData throws NetworkException when DioService fails', () async {
      // Arrange
      final exception = DioException(
        requestOptions: RequestOptions(path: tPath),
        type: DioExceptionType.connectionTimeout,
      );
      when(
        () => mockDioService.get(
          path: any(named: 'path'),
          queryParams: any(named: 'queryParams'),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).thenThrow(exception);

      // Act & Assert
      expect(
        () => apiService.getData(path: tPath, converter: (json) => json),
        throwsA(isA<NetworkException>()),
      );
    });

    test('getListData calls DioService.get and returns parsed list', () async {
      // Arrange
      const tListData = [tData, tData];
      const tListResponseData = {
        'data': tListData,
        'errorCode': 0,
        'errorMsg': '',
      };

      when(
        () => mockDioService.get(
          path: any(named: 'path'),
          queryParams: any(named: 'queryParams'),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).thenAnswer((_) async => tListResponseData);

      // Act
      final result = await apiService.getListData(
        path: tPath,
        dataItemConverter: (json) => json,
      );

      // Assert
      expect(result, isA<ApiBaseResponse>());
      expect(result.data, isA<List>());
      expect(result.data.length, 2);
      verify(() => mockDioService.get(path: tPath)).called(1);
    });
  });
}
