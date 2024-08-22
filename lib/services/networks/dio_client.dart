import 'package:dio/dio.dart';
import 'package:european_countries/utils/config.dart';
import 'package:logger/logger.dart';

class DioClient {
  final Dio _dio;
  final Logger _logger = Logger();

  DioClient() : _dio = Dio(BaseOptions(baseUrl: appUrl)) {
    _dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Dio get dio => _dio;

  void handleError(dynamic e) {
    if (e is DioException) {
      _logger.e('DioError: ${e.message}');
      if (e.response != null) {
        // Log detailed request and response information
        _logger.e('Request URL: ${e.requestOptions.uri}');
        _logger.e('Request Method: ${e.requestOptions.method}');
        _logger.e('Request Headers: ${e.requestOptions.headers}');
        _logger.e('Request Body: ${e.requestOptions.data}');
        _logger.e('Status code: ${e.response?.statusCode}');
        _logger.e('Response Data: ${e.response?.data}');
      } else {
        // This block handles errors without a response, like timeouts or cancellation
        _logger.e('Error sending request: ${e.message}');
        _logger.e('Request URL: ${e.requestOptions.uri}');
        _logger.e('Request Method: ${e.requestOptions.method}');
        _logger.e('Request Headers: ${e.requestOptions.headers}');
        _logger.e('Request Body: ${e.requestOptions.data}');
      }
    } else {
      // Handle non-DioError errors
      _logger.e('Unexpected error: $e');
    }
    throw e;
  }
}
