import 'package:get_it/get_it.dart';
import 'package:lifetap_assignment/bloc/country_picker/country_picker_cubit.dart';
import 'package:lifetap_assignment/bloc/selected_country/selected_country_cubit.dart';
import 'package:lifetap_assignment/data/repository/country/country_repository_impl.dart';
import 'package:lifetap_assignment/data/repository/selected_country/selected_country_repository_impl.dart';
import 'package:lifetap_assignment/foundation/json_reader.dart';

final locator = GetIt.instance; // service locator

class ServiceLocator {
  static void setup() {
    // ?? singleton registrations
    //* json reader
    locator.registerSingleton<JsonReader>(JsonReader());
    //* country repository implementation
    locator.registerSingleton<CountryRepositoryImpl>(
        CountryRepositoryImpl(locator<JsonReader>()));
    //* selected country repository implementation
    locator.registerSingleton<SelectedCountryRepositoryImpl>(
        SelectedCountryRepositoryImpl());
    //?? factory registrations
    //* country picker cubit
    locator.registerFactory(
        () => CountryPickerCubit(locator<CountryRepositoryImpl>()));
    locator.registerFactory(
        () => SelectedCountryCubit(locator<SelectedCountryRepositoryImpl>()));
  }
}
