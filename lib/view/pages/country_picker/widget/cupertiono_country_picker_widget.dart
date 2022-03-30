import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifetap_assignment/bloc/lifetap_bloc.dart';
import 'package:lifetap_assignment/data/model/country_list.dart';
import 'package:lifetap_assignment/foundation/lifetap_constants.dart';

class CupertinoCountryPickerWidget extends StatefulWidget {
  final FixedExtentScrollController scrollCountryNameController;
  final FixedExtentScrollController scrollCountryCodeController;

  const CupertinoCountryPickerWidget({
    Key? key,
    required this.scrollCountryNameController,
    required this.scrollCountryCodeController,
  }) : super(key: key);

  @override
  State<CupertinoCountryPickerWidget> createState() =>
      _CupertinoCountryPickerWidgetState();
}

class _CupertinoCountryPickerWidgetState
    extends State<CupertinoCountryPickerWidget> {
  @override
  void initState() {
    context.read<CountryPickerCubit>().getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      height: itemHeight * 6,
      child: BlocBuilder<CountryPickerCubit, CountryPickerState>(
        builder: (context, state) {
          if (state is CountryPickerLoaded) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 3 * itemHeight,
                        child: Center(
                          child: IgnorePointer(
                            child: CupertinoPicker(
                              itemExtent: itemHeight,
                              squeeze: 1.0,
                              diameterRatio: 1.2,
                              selectionOverlay: Container(
                                decoration: BoxDecoration(
                                  border: Border.symmetric(
                                    horizontal: BorderSide(
                                      color: Colors.white.withOpacity(0.2),
                                    ),
                                  ),
                                ),
                              ),
                              scrollController:
                                  widget.scrollCountryCodeController,
                              onSelectedItemChanged: (index) {},
                              children: state.countries
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          e.code,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: CupertinoPicker(
                        itemExtent: itemHeight,
                        squeeze: 1.5,
                        diameterRatio: 1,
                        backgroundColor: Colors.black,
                        useMagnifier: true,
                        selectionOverlay: Container(
                          decoration: BoxDecoration(
                            border: Border.symmetric(
                              horizontal: BorderSide(
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ),
                          ),
                        ),
                        scrollController: widget.scrollCountryNameController,
                        /* onSelectedItemChanged: (index) {
                                              setState(() {
                                                _selectedItem = index;
                                              });
                                              debugPrint(_scrollController.selectedItem
                                                  .toString());
                                            }, */
                        onSelectedItemChanged: (int value) {
                          widget.scrollCountryCodeController.jumpToItem(value);
                        },
                        children: state.countries
                            .map(
                              (e) => Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  e.name,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    _addCountry(state
                        .countries[widget.scrollCountryNameController.selectedItem]);
                  },
                  child: SizedBox(
                    height: itemHeight,
                    width: MediaQuery.of(context).size.width,
                  ),
                )
              ],
            );
          } else {
            return Center(
              child: Text(
                'No Country Exist',
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          }
        },
      ),
    );
  }

  void _addCountry(Country country) {
    context.read<SelectedCountryCubit>().addCountry(country);
  }
}
