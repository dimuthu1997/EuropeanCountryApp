import 'package:flutter/material.dart';
import 'package:european_countries/model/country_model.dart';

class CountryDetailScreen extends StatelessWidget {
  final Country country;

  const CountryDetailScreen({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          country.name.common,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(country.flags.png),
            const SizedBox(height: 16),
            Text('Official Name: ${country.name.official}',
                style: const TextStyle(fontSize: 18)),
            Text('Population: ${country.population}',
                style: const TextStyle(fontSize: 18)),
            Text('Languages: ${country.languages.values.join(', ')}',
                style: const TextStyle(fontSize: 18)),
            Text('Region: ${country.region}',
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
