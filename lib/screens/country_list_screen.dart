import 'package:dio/dio.dart';
import 'package:european_countries/model/country_model.dart';
import 'package:european_countries/screens/country_detail_screen.dart';
import 'package:european_countries/services/networks/api_service.dart';
import 'package:flutter/material.dart';

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({super.key});

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  late Future<List<Country>> _countriesFuture;
  final ApiService _apiService = ApiService(Dio());

  @override
  void initState() {
    super.initState();
    _countriesFuture = _fetchCountries();
  }

  Future<List<Country>> _fetchCountries() async {
    try {
      return await _apiService.getEuropeanCountries();
    } catch (e) {
      // Handle error
      print("Error: $e");
      return [];
    }
  }

  void _sortCountries(List<Country> countries, String criterion) {
    setState(() {
      switch (criterion) {
        case 'Name':
          countries.sort((a, b) => a.name.common.compareTo(b.name.common));
          break;
        case 'Capital':
          countries.sort((a, b) {
            if (a.capital.isEmpty && b.capital.isEmpty) return 0;
            if (a.capital.isEmpty) return -1;
            if (b.capital.isEmpty) return 1;
            return a.capital.first.compareTo(b.capital.first);
          });
          break;
        case 'Population':
          countries.sort((a, b) => a.population.compareTo(b.population));
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('European Countries'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) async {
              final countries = await _countriesFuture;
              _sortCountries(countries, value);
            },
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'Name', child: Text('Sort by Name')),
              PopupMenuItem(value: 'Capital', child: Text('Sort by Capital')),
              PopupMenuItem(
                  value: 'Population', child: Text('Sort by Population')),
            ],
          ),
        ],
      ),
      body: FutureBuilder<List<Country>>(
        future: _countriesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            final countries = snapshot.data!;
            return ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final country = countries[index];
                return ListTile(
                  leading: Image.network(country.flags.png, width: 50),
                  title: Text(country.name.common),
                  subtitle: Text('Capital: ${country.capital.join(', ')}'),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CountryDetailScreen(country: country),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
