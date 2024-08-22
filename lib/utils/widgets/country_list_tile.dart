import 'package:flutter/material.dart';
import 'package:european_countries/model/country_model.dart';
import 'package:european_countries/screens/country_detail_screen.dart';

class CountryListTile extends StatelessWidget {
  final Country country;

  const CountryListTile({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(country.flags.png, width: 50),
      title: Text(country.name.common),
      subtitle: Text('Capital: ${country.capital.join(', ')}'),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CountryDetailScreen(country: country),
        ),
      ),
    );
  }
}
