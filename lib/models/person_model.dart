import 'package:uuid/uuid.dart';

enum PersonType { sender, recipient }

class Person {
  final String id;
  final PersonType type;
  final String name;
  final String email;
  final String phoneNumber;
  final String country;
  final String city;
  final List<String> address;
  final int postcode;

  Person(
      {String? id,
      this.type = PersonType.sender,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.country,
      required this.city,
      required this.address,
      required this.postcode})
      : id = id ?? const Uuid().v4();
}
