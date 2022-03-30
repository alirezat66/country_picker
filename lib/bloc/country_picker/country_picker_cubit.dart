import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lifetap_assignment/data/model/country_list.dart';
import 'package:lifetap_assignment/data/repository/country/country_repository.dart';

part 'country_picker_state.dart';

class CountryPickerCubit extends Cubit<CountryPickerState> {
  final CountryRepository countryRepository;
  CountryPickerCubit(this.countryRepository) : super(CountryPickerInitial());
  void getCountries() async {
    emit(CountryPickerLoading());
    final list = await countryRepository.getCountries();
    emit(CountryPickerLoaded(list));
  }

  void search(String query) async {
    emit(CountryPickerLoading());
    if (query.isNotEmpty) {
      final list = await countryRepository.search(query);
      if (list.isNotEmpty) {
        emit(CountryPickerLoaded(list));
      } else {
        emit(CountryPickerEmpty());
      }
    } else {
      getCountries();
    }
  }
}
