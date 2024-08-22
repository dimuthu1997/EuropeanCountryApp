import 'package:european_countries/screens/country_list_screen.dart';
import 'package:european_countries/services/provider/countr_provider.dart';
import 'package:european_countries/services/provider/theme_provider.dart';
import 'package:european_countries/services/networks/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

class EuropeanCountriesApp extends StatefulWidget {
  const EuropeanCountriesApp({super.key});

  @override
  State<EuropeanCountriesApp> createState() => _EuropeanCountriesAppState();
}

class _EuropeanCountriesAppState extends State<EuropeanCountriesApp> {
  late ThemeProvider _themeProvider;
  late CountryProvider _countryProvider;
  late ApiService _apiService;

  @override
  void initState() {
    super.initState();
    _themeProvider = ThemeProvider(); // Initialize the ThemeProvider.

    final dio = Dio(); // Create a Dio instance.
    _apiService = ApiService(dio); // Initialize the ApiService.
    _countryProvider = CountryProvider(
        apiService: _apiService); // Initialize the CountryProvider.
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => _themeProvider),
        ChangeNotifierProvider(create: (_) => _countryProvider),
      ],
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false, // Disable the debug banner.
          title: 'European Countries', // Set the title of the app.
          themeMode: ThemeMode.light, // Set the default theme mode to light.
          theme: context.read<ThemeProvider>().theme,
          home: const CountryListScreen(),
        ),
      ),
    );
  }
}
