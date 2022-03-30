import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../data/fixtures/fixture_reader.dart';
import '../data/repository/country/country_repository_impl_test.mocks.dart';

void main() {
  late MyMockJsonReader mockJsonReader;
  setUp(() {
    mockJsonReader = MyMockJsonReader();
  });
  group('test json reader', () {
    setUp(() {
      when(mockJsonReader.read('countries.json'))
          .thenAnswer((_) async => fixture('countries.json'));
    });
    test('test reading from assets', () async {
      //act
      String json = await mockJsonReader.read('countries.json');
      //assert
      expect(json.isNotEmpty, true);
    });
    test('test correct reading from countries', () async {
      // arrange
      String json = await mockJsonReader.read('countries.json');

      //act
      Map<String, dynamic> decodedJson = jsonDecode(json);

      //assert
      expect(decodedJson.containsKey('countries'), true);
    });
  });
}
