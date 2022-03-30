import 'package:flutter/material.dart';
import 'package:lifetap_assignment/foundation/lifetap_constants.dart';
import 'package:lifetap_assignment/view/pages/country_picker/widget/country_holder.dart';
import 'package:lifetap_assignment/view/pages/country_picker/widget/country_picker_widget.dart';
import 'package:lifetap_assignment/view/pages/country_picker/widget/cupertiono_country_picker_widget.dart';

class CountryPickerPage extends StatefulWidget {
  const CountryPickerPage({Key? key}) : super(key: key);

  @override
  State<CountryPickerPage> createState() => _CountryPickerPageState();
}

class _CountryPickerPageState extends State<CountryPickerPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              countryPickerTitle,
              maxLines: 2,
            ),
          ),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xff16181F),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: kToolbarHeight / 2,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            height: 5,
                            width: 34,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.5),
                                color: const Color(0xff47484e)),
                          ),
                        ],
                      ),
                    ),
                    Text('Selected countries',
                        style: Theme.of(context).textTheme.headline5),
                    const Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                        child: SingleChildScrollView(
                          child: CountryHolder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
                bottom: 0, left: 0, right: 0, child: CountryPickerWidget())
          ],
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
