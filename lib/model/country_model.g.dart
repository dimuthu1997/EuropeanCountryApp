// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      flags: Flags.fromJson(json['flags'] as Map<String, dynamic>),
      name: Name.fromJson(json['name'] as Map<String, dynamic>),
      capital:
          (json['capital'] as List<dynamic>).map((e) => e as String).toList(),
      region: json['region'] as String,
      languages: Map<String, String>.from(json['languages'] as Map),
      population: (json['population'] as num).toInt(),
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'flags': instance.flags,
      'name': instance.name,
      'capital': instance.capital,
      'region': instance.region,
      'languages': instance.languages,
      'population': instance.population,
    };

Flags _$FlagsFromJson(Map<String, dynamic> json) => Flags(
      png: json['png'] as String,
      svg: json['svg'] as String,
      alt: json['alt'] as String,
    );

Map<String, dynamic> _$FlagsToJson(Flags instance) => <String, dynamic>{
      'png': instance.png,
      'svg': instance.svg,
      'alt': instance.alt,
    };

Name _$NameFromJson(Map<String, dynamic> json) => Name(
      common: json['common'] as String,
      official: json['official'] as String,
      nativeName: (json['nativeName'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, NativeName.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'common': instance.common,
      'official': instance.official,
      'nativeName': instance.nativeName,
    };

NativeName _$NativeNameFromJson(Map<String, dynamic> json) => NativeName(
      official: json['official'] as String,
      common: json['common'] as String,
    );

Map<String, dynamic> _$NativeNameToJson(NativeName instance) =>
    <String, dynamic>{
      'official': instance.official,
      'common': instance.common,
    };
