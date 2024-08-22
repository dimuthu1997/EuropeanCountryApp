import 'package:european_countries/services/provider/countr_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:european_countries/utils/widgets/country_list_tile.dart';

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({super.key});

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CountryProvider>(context, listen: false).fetchCountries();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countryProvider = Provider.of<CountryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'European Countries',
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) => countryProvider.sortCountries(value),
            itemBuilder: (context) => const [
              PopupMenuItem(
                  value: 'Name',
                  child: Text(
                    'Sort by Name',
                    style: TextStyle(fontSize: 14),
                  )),
              PopupMenuItem(
                  value: 'Capital',
                  child: Text(
                    'Sort by Capital',
                    style: TextStyle(fontSize: 14),
                  )),
              PopupMenuItem(
                  value: 'Population',
                  child: Text(
                    'Sort by Population',
                    style: TextStyle(fontSize: 14),
                  )),
            ],
          ),
        ],
      ),
      body: countryProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : countryProvider.countries.isEmpty
              ? const Center(
                  child: Text(
                  'No data available',
                  style: TextStyle(fontSize: 18),
                ))
              : ListView.builder(
                  itemCount: countryProvider.countries.length,
                  itemBuilder: (context, index) {
                    final country = countryProvider.countries[index];
                    return CountryListTile(country: country);
                  },
                ),
    );
  }
}
