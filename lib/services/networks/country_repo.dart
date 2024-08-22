import 'package:european_countries/model/country_model.dart';
import 'package:european_countries/services/networks/api_service.dart';
import 'package:european_countries/services/networks/dio_client.dart';
import 'package:dio/dio.dart';

class CountryRepository {
  final ApiService _apiService;

  CountryRepository() : _apiService = ApiService(DioClient().dio);

  Future<List<Country>> fetchEuropeanCountries() async {
    try {
      return await _apiService.getEuropeanCountries();
    } catch (e) {
      if (e is DioException) {
        DioClient().handleError(e); // Use the handleError method
      }
      rethrow;
    }
  }
}
