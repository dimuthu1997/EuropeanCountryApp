import 'package:european_countries/model/country_model.dart';
import 'package:european_countries/services/networks/api_service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CountryProvider with ChangeNotifier {
  List<Country> _countries = [];
  final ApiService _apiService;
  final Logger _logger = Logger();
  bool _isLoading = false;

  CountryProvider({required ApiService apiService}) : _apiService = apiService;

  List<Country> get countries => _countries;
  bool get isLoading => _isLoading;

  Future<void> fetchCountries() async {
    _isLoading = true;
    notifyListeners();

    try {
      _countries = await _apiService.getEuropeanCountries();
    } catch (e) {
      _logger.e("Failed to fetch countries: $e");
      _countries = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  void setCountriesForTesting(List<Country> countries) {
    _countries = countries;
    notifyListeners();
  }

  void sortCountries(String criterion) {
    switch (criterion) {
      case 'Name':
        _countries.sort((a, b) => a.name.common.compareTo(b.name.common));
        break;
      case 'Capital':
        _countries.sort((a, b) {
          if (a.capital.isEmpty && b.capital.isEmpty) return 0;
          if (a.capital.isEmpty) return -1;
          if (b.capital.isEmpty) return 1;
          return a.capital.first.compareTo(b.capital.first);
        });
        break;
      case 'Population':
        _countries.sort((a, b) => a.population.compareTo(b.population));
        break;
    }
    notifyListeners();
  }
}
