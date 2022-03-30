import 'package:flutter_test/flutter_test.dart';
import 'package:lifetap_assignment/data/repository/country/country_repository_impl.dart';
import 'package:lifetap_assignment/foundation/json_reader.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixture_reader.dart';
import 'country_repository_impl_test.mocks.dart';

@GenerateMocks([
  JsonReader
], customMocks: [
  MockSpec<JsonReader>(as: #MyMockJsonReader, returnNullOnMissingStub: true),
])
void main() {
  late MyMockJsonReader mockJsonReader;
  late CountryRepositoryImpl repositoryImpl;
  setUp(() {
    mockJsonReader = MyMockJsonReader();
    repositoryImpl = CountryRepositoryImpl(mockJsonReader);
  });
  group('repository fetching data test', () {
    setUp(() {
      when(mockJsonReader.read('countries.json'))
          .thenAnswer((_) async => fixture('countries.json'));
    });
    test('first read', () async{
      final list = await repositoryImpl.getCountries();
      verify(mockJsonReader.read('countries.json'));
      expect(list.isNotEmpty, true);
    });
    test('second fetch should read data from cache', () async{
      final list = await repositoryImpl.getCountries();
      final list2 = await repositoryImpl.getCountries();
      verify(mockJsonReader.read('countries.json')).called(1);
      expect(list.length == list2.length, true);
    });
  });
  group('test search method on repository', () {
    setUp(() {
      when(mockJsonReader.read('countries.json'))
          .thenAnswer((_) async=> fixture('countries.json'));
    });
    test('search in repository on Al character', () async{
      final list = await repositoryImpl.search('al');
      expect(list.length, 2);
    });
    test('search in repository with AL should return same result', () async{
      final list = await repositoryImpl.search('AL');
      expect(list.length, 2);
    });
    test('search with non country should return empty list', () async{
      final list = await repositoryImpl.search('tester');
      expect(list.isEmpty, true);
    });
  });
}
