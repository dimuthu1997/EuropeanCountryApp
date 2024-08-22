import 'package:european_countries/services/provider/countr_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:european_countries/services/networks/api_service.dart';
import 'package:european_countries/model/country_model.dart';

// Define the Mock class
class MockApiService extends Mock implements ApiService {}

void main() {
  late CountryProvider countryProvider;
  late MockApiService mockApiService;

  setUp(() {
    mockApiService = MockApiService();
    countryProvider = CountryProvider(apiService: mockApiService);
  });

  test('Initial state is correct', () {
    expect(countryProvider.countries, []);
    expect(countryProvider.isLoading, false);
  });

  test('fetchCountries updates state correctly', () async {
    // Arrange
    final countries = [
      Country(
        flags: Flags(png: 'flag.png', svg: 'flag.svg', alt: 'flag'),
        name: Name(
          common: 'Country A',
          official: 'Country A Official',
          nativeName: {},
        ),
        capital: ['Capital A'],
        region: 'Europe',
        languages: {'en': 'English'},
        population: 1000000,
      ),
    ];

    // Mock the method to return a Future with the countries list
    when(mockApiService.getEuropeanCountries()).thenAnswer(
      (_) async => countries,
    );

    // Act
    await countryProvider.fetchCountries();

    // Assert
    expect(countryProvider.countries, equals(countries));
    expect(countryProvider.isLoading, false);

    // Verify that getEuropeanCountries was called once
    verify(mockApiService.getEuropeanCountries()).called(1);
  });

  test('sortCountries sorts by name', () {
    // Arrange
    final country1 = Country(
      flags: Flags(png: 'flag.png', svg: 'flag.svg', alt: 'flag'),
      name: Name(
        common: 'Country B',
        official: 'Country B Official',
        nativeName: {},
      ),
      capital: ['Capital B'],
      region: 'Europe',
      languages: {'en': 'English'},
      population: 1000000,
    );
    final country2 = Country(
      flags: Flags(png: 'flag.png', svg: 'flag.svg', alt: 'flag'),
      name: Name(
        common: 'Country A',
        official: 'Country A Official',
        nativeName: {},
      ),
      capital: ['Capital A'],
      region: 'Europe',
      languages: {'en': 'English'},
      population: 1000000,
    );

    countryProvider.setCountriesForTesting([country1, country2]);

    // Act
    countryProvider.sortCountries('Name');

    // Assert
    expect(countryProvider.countries[0].name.common, 'Country A');
    expect(countryProvider.countries[1].name.common, 'Country B');
  });
}
