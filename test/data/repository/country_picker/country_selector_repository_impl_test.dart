import 'package:flutter_test/flutter_test.dart';
import 'package:lifetap_assignment/data/model/country_list.dart';
import 'package:lifetap_assignment/data/repository/selected_country/selected_country_repository_impl.dart';
import 'package:mockito/mockito.dart';

// ignore: must_be_immutable
class MockCountry extends Mock implements Country {}

void main() {
  late SelectedCountryRepositoryImpl _repositoryImpl;

  setUp(() {
    _repositoryImpl = SelectedCountryRepositoryImpl();
  });
  group('test add method', () {
    test('add country to list', () {
      final list = _repositoryImpl.addCountry(MockCountry());
      expect(list.isNotEmpty, true);
    });
    test('do not add when the country exist', () {
      final country = MockCountry();
      _repositoryImpl.addCountry(country);
      final list = _repositoryImpl.addCountry(country);

      expect(list.length, 1);
    });
  });
  group('test remove method', () {
    test('return 0 size without error when our size is zero', () {
      final list = _repositoryImpl.removeCountry(MockCountry());
      expect(list.isEmpty, true);
    });
    test('delete item in true way', () {
      final country = MockCountry();
      _repositoryImpl.addCountry(country);
      final list = _repositoryImpl.removeCountry(country);
      expect(list.isEmpty, true);
    });
  });
  group('test get countries method', () {
    test('the first calling', () {
      final list = _repositoryImpl.getSelectedCountries();
      expect(list.isEmpty, true);
    });
    test('return true value after add', () {
      _repositoryImpl.addCountry(MockCountry());
      final list = _repositoryImpl.getSelectedCountries();
      expect(list.length, 1);
    });
    test('return true value after remove', () {
      _repositoryImpl.removeCountry(MockCountry());
      final list = _repositoryImpl.getSelectedCountries();
      expect(list.length, 0);
    });
  });
}
