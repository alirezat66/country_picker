import 'dart:convert';

import 'package:lifetap_assignment/data/model/country_list.dart';
import 'package:lifetap_assignment/foundation/json_reader.dart';

import 'country_repository.dart';

class CountryRepositoryImpl implements CountryRepository {
  final JsonReader jsonReader;
  CountryRepositoryImpl(this.jsonReader);
  List<Country> cachedCountries = [];
  @override
  Future<List<Country>> getCountries() async{
    if (cachedCountries.isEmpty) {
      Map<String, dynamic> jsonMap =
          jsonDecode(await jsonReader.read('countries.json'));
      cachedCountries = CountryList.fromJson(jsonMap).countries;
    }

    return cachedCountries;
  }

  @override
  Future<List<Country>> search(String query) async{
    if (cachedCountries.isEmpty) {
      await getCountries();
    }
    return cachedCountries
        .where((element) =>
            element.name.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
  }
}
