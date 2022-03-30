import 'package:lifetap_assignment/data/model/country_list.dart';

abstract class SelectedCountryRepository {
  List<Country> addCountry(Country item);
  List<Country> removeCountry(Country item);
  List<Country> getSelectedCountries();
}
