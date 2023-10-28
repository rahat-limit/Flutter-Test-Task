import 'package:flutter/material.dart';
import 'package:test_task/main.dart';
import 'package:test_task/models/person_model.dart';

class AddressItem extends StatelessWidget {
  final Person person;
  const AddressItem({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
            color: darkColor, borderRadius: BorderRadius.circular(12)),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              child: Column(children: [
            Row(children: [
              Expanded(
                  child: Text(
                person.name,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    color: Colors.white),
              ))
            ]),
            const SizedBox(height: 8),
            Row(children: [
              Expanded(
                  child: Text(
                '${person.country}, ${person.city}, ${person.address}, ${person.postcode}',
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.white),
              ))
            ])
          ])),
          const Image(
              image: AssetImage('assets/icons/link_icon.png'),
              width: 20,
              height: 20)
        ]));
  }
}
