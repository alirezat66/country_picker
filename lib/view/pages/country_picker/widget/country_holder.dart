import 'package:flutter/material.dart';
import 'package:lifetap_assignment/bloc/lifetap_bloc.dart';
import 'package:lifetap_assignment/data/model/country_list.dart';
import 'package:lifetap_assignment/view/pages/country_picker/widget/chips_item.dart';
import 'package:lifetap_assignment/view/widgets/entrance_fader.dart';

class CountryHolder extends StatefulWidget {
  const CountryHolder({Key? key}) : super(key: key);

  @override
  State<CountryHolder> createState() => _CountryHolderState();
}

class _CountryHolderState extends State<CountryHolder> {
  @override
  void initState() {
    context.read<SelectedCountryCubit>().getSelectedCountries();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: const Color(0xff787993).withOpacity(0.18),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<SelectedCountryCubit, SelectedCountryState>(
              builder: (context, state) {
                if (state is SelectedCountyLoaded) {
                  return state.selectedCountries.isEmpty
                      ? Center(
                          child: Text(
                            'No Item Selected Yet',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        )
                      : Wrap(
                          alignment: WrapAlignment.start,
                          runAlignment: WrapAlignment.start,
                          children: state.selectedCountries
                              .map((e) => EntranceFader(
                                      child: ChipsItem(
                                    e,
                                    onRemove: (country) {
                                      _removeCountry(country);
                                    },
                                  )))
                              .toList(),
                          spacing: 16,
                          runSpacing: 8,
                        );
                } else {
                  return Text(
                    'No Item Selected Yet',
                    style: Theme.of(context).textTheme.bodyText2,
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  void _removeCountry(Country country) {
    context.read<SelectedCountryCubit>().removeCountry(country);
  }
}
