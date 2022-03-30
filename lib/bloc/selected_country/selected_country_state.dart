part of 'selected_country_cubit.dart';

abstract class SelectedCountryState extends Equatable {
  const SelectedCountryState();

  @override
  List<Object> get props => [];
}

class SelectedCountryInitial extends SelectedCountryState {}

class SelectedCountryLoading extends SelectedCountryState {}

class SelectedCountyLoaded extends SelectedCountryState {
  final List<Country> selectedCountries;
  const SelectedCountyLoaded(this.selectedCountries);
  @override
  List<Object> get props => [selectedCountries];
}
