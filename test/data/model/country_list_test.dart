import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:lifetap_assignment/data/model/country_list.dart';

import '../fixtures/fixture_reader.dart';

void main() {
  test('test from json', () {
    // arrange
    String json = fixture('countries.json');
    Map<String, dynamic> decodedJson = jsonDecode(json);

    // act
    final list = CountryList.fromJson(decodedJson);

    //assert
    expect(list.countries.isNotEmpty, true);
  });
}
