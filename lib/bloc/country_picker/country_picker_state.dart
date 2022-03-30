part of 'country_picker_cubit.dart';

class CountryPickerState extends Equatable {
  const CountryPickerState();
  @override
  List<Object?> get props => [];
}

class CountryPickerInitial extends CountryPickerState {}
class CountryPickerLoading extends CountryPickerState{}
class CountryPickerLoaded extends CountryPickerState {
  final List<Country> countries;
  const CountryPickerLoaded(this.countries);
  @override
  List<Object?> get props => [countries];
}

class CountryPickerEmpty extends CountryPickerState {}
