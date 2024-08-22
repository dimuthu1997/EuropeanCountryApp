import 'package:european_countries/utils/widgets/country_list_tile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:european_countries/model/country_model.dart';

void main() {
  testWidgets('CountryListTile displays country information',
      (WidgetTester tester) async {
    // Arrange
    final country = Country(
      flags: Flags(png: 'https://example.com/flag.png', svg: '...', alt: '...'),
      name: Name(
          common: 'CountryName', official: 'CountryOfficial', nativeName: {}),
      capital: ['CapitalCity'],
      region: 'Region',
      languages: {'en': 'English'},
      population: 123456,
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CountryListTile(country: country),
      ),
    ));

    // Act
    final flagFinder = find.byType(Image);
    final nameFinder = find.text('CountryName');
    final capitalFinder = find.text('Capital: CapitalCity');

    // Assert
    expect(flagFinder, findsOneWidget);
    expect(nameFinder, findsOneWidget);
    expect(capitalFinder, findsOneWidget);
  });
}
