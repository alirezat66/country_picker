import 'package:flutter/material.dart';

class CountrySearchWidget extends StatelessWidget {
  final TextEditingController searchController;
  const CountrySearchWidget({Key? key, required this.searchController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
      child: TextFormField(
        cursorColor: Colors.red,
        autofocus: false,
        controller: searchController,
        decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.search,
            ),
            hintText: 'Search'),
      ),
    );
  }
}
