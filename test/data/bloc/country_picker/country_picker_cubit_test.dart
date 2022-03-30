import 'package:flutter_test/flutter_test.dart';
import 'package:lifetap_assignment/bloc/lifetap_bloc.dart';
import 'package:lifetap_assignment/data/repository/country/country_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';

import '../../fixtures/fixture_reader.dart';
import 'country_picker_cubit_test.mocks.dart';

@GenerateMocks([
  CountryRepositoryImpl
], customMocks: [
  MockSpec<CountryRepositoryImpl>(
      as: #MyMockCountryRepositoryImpl, returnNullOnMissingStub: true)
])
void main() {
  late MyMockCountryRepositoryImpl mockCountryRepositoryImpl;

  setUp(() {
    mockCountryRepositoryImpl = MyMockCountryRepositoryImpl();
  });
  void setUpMockOutput() {
    when(mockCountryRepositoryImpl.getCountries())
        .thenAnswer((_) async => getMockCountries());
    when(mockCountryRepositoryImpl.search('al'))
        .thenAnswer((_) async => getMockSearch('al'));
    when(mockCountryRepositoryImpl.search('tester'))
        .thenAnswer((_) async => getMockSearch('tester'));
  }

  CountryPickerCubit buildBloc() {
    return CountryPickerCubit(mockCountryRepositoryImpl);
  }

  group('constructor', () {
    test('works properly', () {
      expect(buildBloc, returnsNormally);
    });
    test('has correct initial state', () {
      expect(
        buildBloc().state,
        equals(CountryPickerInitial()),
      );
    });
  });
  group('test read all data from repository', () {
    setUp(() {
      setUpMockOutput();
    });
    blocTest<CountryPickerCubit, CountryPickerState>(
        'change state from init to loaded',
        build: buildBloc,
        act: (cubit) {
          cubit.getCountries();
        },
        expect: () =>
            [CountryPickerLoading(), CountryPickerLoaded(getMockCountries())]);
  });
  group('test search in bloc', () {
    setUp(() {
      setUpMockOutput();
    });
    blocTest<CountryPickerCubit, CountryPickerState>(
        'change state to loaded with search',
        build: buildBloc,
        act: (cubit) {
          cubit.search('al');
        },
        expect: () =>
            [CountryPickerLoading(), CountryPickerLoaded(getMockSearch('al'))]);
    blocTest<CountryPickerCubit, CountryPickerState>(
        'change state from init to empty',
        build: buildBloc,
        act: (cubit) {
          cubit.search('tester');
        },
        expect: () => [CountryPickerLoading(), CountryPickerEmpty()]);
  });
}
