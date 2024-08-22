import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:european_countries/services/networks/dio_client.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late DioClient dioClient;

  setUp(() {
    dioClient = DioClient();
  });

  test('handleError logs Dio exceptions', () {
    // Arrange
    final dioException = DioException(
      requestOptions: RequestOptions(path: 'test'),
      error: 'test error',
    );
    // Act
    dioClient.handleError(dioException);

    // Assert
    // Check logger output (mock logger or capture logs if possible)
  });
}
