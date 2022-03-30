import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lifetap_assignment/bloc/selected_country/selected_country_cubit.dart';
import 'package:lifetap_assignment/data/repository/selected_country/selected_country_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../repository/country_picker/country_selector_repository_impl_test.dart';
import 'selected_country_cubit_test.mocks.dart';

@GenerateMocks([
  SelectedCountryRepositoryImpl
], customMocks: [
  MockSpec<SelectedCountryRepositoryImpl>(
      as: #MyMockSelectedCountryRepositoryImpl, returnNullOnMissingStub: true)
])
void main() {
  late MyMockSelectedCountryRepositoryImpl mockRepository;
  late MockCountry country;
  void setUpMockOutput() {
    when(mockRepository.getSelectedCountries()).thenAnswer((_) => []);
    when(mockRepository.addCountry(country)).thenAnswer((_) => [country]);
    when(mockRepository.removeCountry(country)).thenAnswer((_) => []);
  }

  setUp(() {
    country = MockCountry();
    mockRepository = MyMockSelectedCountryRepositoryImpl();
  });
  SelectedCountryCubit buildBloc() {
    return SelectedCountryCubit(mockRepository);
  }

  group('constructor', () {
    test('works properly', () {
      expect(buildBloc, returnsNormally);
    });
    test('has correct initial state', () {
      expect(
        buildBloc().state,
        equals(SelectedCountryInitial()),
      );
    });
  });
  group('test get all selected countries from repository', () {
    setUp(() {
      setUpMockOutput();
    });
    blocTest<SelectedCountryCubit, SelectedCountryState>(
        'change state from init to loaded',
        build: buildBloc,
        act: (cubit) {
          cubit.getSelectedCountries();
        },
        expect: () =>
            [SelectedCountryLoading(), const SelectedCountyLoaded([])]);
  });
  group('test add country to repository', () {
    setUp(() {
      setUpMockOutput();
    });
    blocTest<SelectedCountryCubit, SelectedCountryState>(
        'change state from init to loaded',
        build: buildBloc,
        act: (cubit) {
          cubit.addCountry(country);
        },
        expect: () => [
              SelectedCountryLoading(),
              SelectedCountyLoaded([country])
            ]);
  });

  group('test remove country from repository', () {
    setUp(() {
      setUpMockOutput();
    });
    blocTest<SelectedCountryCubit, SelectedCountryState>(
        'change state from init to loaded',
        build: buildBloc,
        act: (cubit) {
          cubit.addCountry(country);
          cubit.removeCountry(country);
        },
        expect: () => [
              SelectedCountryLoading(),
              SelectedCountyLoaded([country]),
              SelectedCountryLoading(),
              const SelectedCountyLoaded([])
            ]);
  });
}
