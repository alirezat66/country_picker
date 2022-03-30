// Mocks generated by Mockito 5.1.0 from annotations
// in lifetap_assignment/test/data/repository/country/country_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:lifetap_assignment/foundation/json_reader.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [JsonReader].
///
/// See the documentation for Mockito's code generation for more information.
class MockJsonReader extends _i1.Mock implements _i2.JsonReader {
  MockJsonReader() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<String> read(String? name) =>
      (super.noSuchMethod(Invocation.method(#read, [name]),
          returnValue: Future<String>.value('')) as _i3.Future<String>);
}

/// A class which mocks [JsonReader].
///
/// See the documentation for Mockito's code generation for more information.
class MyMockJsonReader extends _i1.Mock implements _i2.JsonReader {
  @override
  _i3.Future<String> read(String? name) =>
      (super.noSuchMethod(Invocation.method(#read, [name]),
          returnValue: Future<String>.value('')) as _i3.Future<String>);
}
