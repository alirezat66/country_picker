import 'package:flutter/services.dart';

class JsonReader {
  Future<String> read(String name) async {
    return await rootBundle.loadString('assets/$name');
  }
}
