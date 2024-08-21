import 'package:european_countries/screens/country_list_screen.dart';
import 'package:european_countries/services/provider/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EuropeanCountriesApp extends StatefulWidget {
  const EuropeanCountriesApp({super.key});

  @override
  State<EuropeanCountriesApp> createState() => _EuropeanCountriesAppState();
}

class _EuropeanCountriesAppState extends State<EuropeanCountriesApp> {
  late ThemeProvider _themeProvider;

  @override
  void initState() {
    _themeProvider = ThemeProvider(); // Initialize the ThemeProvider.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => _themeProvider),
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
