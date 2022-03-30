import 'package:flutter/material.dart';
import 'package:lifetap_assignment/bloc/lifetap_bloc.dart';
import 'package:lifetap_assignment/view/pages/country_picker/widget/country_search_widget.dart';
import 'package:lifetap_assignment/view/pages/country_picker/widget/cupertiono_country_picker_widget.dart';

class CountryPickerWidget extends StatefulWidget {
  const CountryPickerWidget({Key? key}) : super(key: key);

  @override
  State<CountryPickerWidget> createState() => _CountryPickerWidgetState();
}

class _CountryPickerWidgetState extends State<CountryPickerWidget> {
  late FixedExtentScrollController _scrollCountryNameController;
  late FixedExtentScrollController _scrollCountryCodeController;
  late TextEditingController _searchController;
  @override
  void initState() {
    _scrollCountryNameController = FixedExtentScrollController();
    _scrollCountryCodeController = FixedExtentScrollController();
    _searchController = TextEditingController();
    _searchController.addListener(_search);
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CountrySearchWidget(searchController: _searchController),
          CupertinoCountryPickerWidget(
            scrollCountryCodeController: _scrollCountryCodeController,
            scrollCountryNameController: _scrollCountryNameController,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void _search() {
    if (_searchController.text.isNotEmpty) {
      _scrollCountryCodeController.jumpTo(0);
      _scrollCountryNameController.jumpTo(0);
    }
    context.read<CountryPickerCubit>().search(_searchController.text);
  }
}
