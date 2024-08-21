import 'package:dio/dio.dart';
import 'package:european_countries/model/country_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://restcountries.com/v3.1")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/region/europe?fields=name,capital,flags,region,languages,population")
  Future<List<Country>> getEuropeanCountries();
}
