import 'dart:convert';
import 'dart:io';

import 'package:lifetap_assignment/data/model/country_list.dart';

String fixture(String name) => File('assets/$name').readAsStringSync();
List<Country> getMockCountries() {
  Map<String, dynamic> mapJson = jsonDecode(fixture('countries.json'));
  return CountryList.fromJson(mapJson).countries;
}

List<Country> getMockSearch(String query) {
  Map<String, dynamic> mapJson = jsonDecode(fixture('countries.json'));
  return CountryList.fromJson(mapJson)
      .countries
      .where((element) =>
          element.name.toLowerCase().startsWith(query.toLowerCase()))
      .toList();
}
