import 'package:lifetap_assignment/data/model/country_list.dart';

abstract class CountryRepository {
  Future<List<Country>> getCountries();
  Future<List<Country>> search(String query);
}
