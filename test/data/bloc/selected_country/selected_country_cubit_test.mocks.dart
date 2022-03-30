// Mocks generated by Mockito 5.1.0 from annotations
// in lifetap_assignment/test/data/bloc/selected_country/selected_country_cubit_test.dart.
// Do not manually edit this file.

import 'package:lifetap_assignment/data/model/country_list.dart' as _i3;
import 'package:lifetap_assignment/data/repository/selected_country/selected_country_repository_impl.dart'
    as _i2;
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

/// A class which mocks [SelectedCountryRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockSelectedCountryRepositoryImpl extends _i1.Mock
    implements _i2.SelectedCountryRepositoryImpl {
  MockSelectedCountryRepositoryImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i3.Country> get selectedCountries =>
      (super.noSuchMethod(Invocation.getter(#selectedCountries),
          returnValue: <_i3.Country>[]) as List<_i3.Country>);
  @override
  set selectedCountries(List<_i3.Country>? _selectedCountries) => super
      .noSuchMethod(Invocation.setter(#selectedCountries, _selectedCountries),
          returnValueForMissingStub: null);
  @override
  List<_i3.Country> addCountry(_i3.Country? item) =>
      (super.noSuchMethod(Invocation.method(#addCountry, [item]),
          returnValue: <_i3.Country>[]) as List<_i3.Country>);
  @override
  List<_i3.Country> getSelectedCountries() =>
      (super.noSuchMethod(Invocation.method(#getSelectedCountries, []),
          returnValue: <_i3.Country>[]) as List<_i3.Country>);
  @override
  List<_i3.Country> removeCountry(_i3.Country? item) =>
      (super.noSuchMethod(Invocation.method(#removeCountry, [item]),
          returnValue: <_i3.Country>[]) as List<_i3.Country>);
}

/// A class which mocks [SelectedCountryRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MyMockSelectedCountryRepositoryImpl extends _i1.Mock
    implements _i2.SelectedCountryRepositoryImpl {
  @override
  List<_i3.Country> get selectedCountries =>
      (super.noSuchMethod(Invocation.getter(#selectedCountries),
          returnValue: <_i3.Country>[]) as List<_i3.Country>);
  @override
  set selectedCountries(List<_i3.Country>? _selectedCountries) => super
      .noSuchMethod(Invocation.setter(#selectedCountries, _selectedCountries),
          returnValueForMissingStub: null);
  @override
  List<_i3.Country> addCountry(_i3.Country? item) =>
      (super.noSuchMethod(Invocation.method(#addCountry, [item]),
          returnValue: <_i3.Country>[]) as List<_i3.Country>);
  @override
  List<_i3.Country> getSelectedCountries() =>
      (super.noSuchMethod(Invocation.method(#getSelectedCountries, []),
          returnValue: <_i3.Country>[]) as List<_i3.Country>);
  @override
  List<_i3.Country> removeCountry(_i3.Country? item) =>
      (super.noSuchMethod(Invocation.method(#removeCountry, [item]),
          returnValue: <_i3.Country>[]) as List<_i3.Country>);
}