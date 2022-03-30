import 'package:flutter/material.dart';
import 'package:lifetap_assignment/data/model/country_list.dart';

class ChipsItem extends StatelessWidget {
  final Country country;
  final Function(Country) onRemove;
  const ChipsItem(this.country, {Key? key, required this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffD8D8D8).withOpacity(0.3025),
          borderRadius: BorderRadius.circular(14.5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              country.name,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: () {
                onRemove(country);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.close_sharp,
                  size: 16,
                  color: Color(0xff5e5f66),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
