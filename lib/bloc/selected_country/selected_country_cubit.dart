import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lifetap_assignment/data/model/country_list.dart';
import 'package:lifetap_assignment/data/repository/selected_country/selected_country_repository.dart';

part 'selected_country_state.dart';

class SelectedCountryCubit extends Cubit<SelectedCountryState> {
  final SelectedCountryRepository selectedCountryRepository;
  SelectedCountryCubit(this.selectedCountryRepository)
      : super(SelectedCountryInitial());
  void getSelectedCountries() {
    emit(SelectedCountryLoading());
    emit(
        SelectedCountyLoaded(selectedCountryRepository.getSelectedCountries()));
  }

  void addCountry(Country country) {
    emit(SelectedCountryLoading());
    emit(SelectedCountyLoaded(selectedCountryRepository.addCountry(country)));
  }

  void removeCountry(Country country) {
    emit(SelectedCountryLoading());
    emit(
        SelectedCountyLoaded(selectedCountryRepository.removeCountry(country)));
  }
}
