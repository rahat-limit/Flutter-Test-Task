import 'package:flutter/material.dart';
import 'package:test_task/models/person_model.dart';
import 'package:test_task/partials/address_item_widget.dart';
import 'package:test_task/partials/search_input_widget.dart';

class SelectModalWidget extends StatefulWidget {
  final PersonType type;
  const SelectModalWidget({super.key, required this.type});

  @override
  State<SelectModalWidget> createState() => _SelectModalWidgetState();
}

class _SelectModalWidgetState extends State<SelectModalWidget> {
  TextEditingController? _searchController;
  List<Person> addresses = [
    Person(
        name: 'Denilev Egor',
        email: 'email',
        phoneNumber: 'phoneNumber',
        country: 'Belarus',
        city: 'Minsk',
        address: ['Derzhinskogo 3b'],
        postcode: 80100),
    Person(
        type: PersonType.recipient,
        name: 'Ko Yuri',
        email: 'email',
        phoneNumber: 'phoneNumber',
        country: 'Italy',
        city: 'Naple',
        address: ['Via 3b Toledo 256'],
        postcode: 220069),
  ];
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController!.dispose();
  }

  void updateSearchResults() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SearchInputWidget(
                controller: _searchController!, callback: updateSearchResults),
            ...addresses
                .where((e) =>
                    e.type == widget.type &&
                    e.name.toString().toLowerCase().contains(
                        _searchController!.text.toString().toLowerCase()))
                .map((person) => AddressItem(person: person)),
          ],
        ));
  }
}
