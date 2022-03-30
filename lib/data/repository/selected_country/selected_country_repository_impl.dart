import 'package:lifetap_assignment/data/model/country_list.dart';
import 'package:lifetap_assignment/data/repository/selected_country/selected_country_repository.dart';

class SelectedCountryRepositoryImpl implements SelectedCountryRepository {
  List<Country> selectedCountries = [];
  @override
  List<Country> addCountry(Country item) {
    if (!selectedCountries.contains(item)) {
      selectedCountries.add(item);
    }

    return selectedCountries;
  }

  @override
  List<Country> getSelectedCountries() {
    return selectedCountries;
  }

  @override
  List<Country> removeCountry(Country item) {
    selectedCountries.remove(item);
    return selectedCountries;
  }
}
