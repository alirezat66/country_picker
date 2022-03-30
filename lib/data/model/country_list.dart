import 'package:equatable/equatable.dart';

class CountryList {
  CountryList({
    required this.countries,
  });
  late final List<Country> countries;

  CountryList.fromJson(Map<String, dynamic> json) {
    countries =
        List.from(json['countries']).map((e) => Country.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['countries'] = countries.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Country extends Equatable {
  const Country({
    required this.name,
    required this.code,
  });
  final String name;
  final String code;

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(name: json['name'], code: json['code']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['code'] = code;
    return _data;
  }

  @override
  List<Object?> get props => [name, code];
}
