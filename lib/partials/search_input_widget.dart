import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_task/main.dart';

class SearchInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final VoidCallback callback;
  const SearchInputWidget(
      {super.key,
      required this.controller,
      this.placeholder = 'Search',
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
        controller: controller,
        placeholder: placeholder,
        placeholderStyle: const TextStyle(color: fontGreyColor),
        onChanged: (value) => callback(),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor)),
        prefix: const Row(
          children: [
            SizedBox(
              width: 8,
            ),
            Icon(CupertinoIcons.search, color: fontGreyColor, size: 22)
          ],
        ));
  }
}
