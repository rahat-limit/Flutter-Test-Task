import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_task/main.dart';

class TextInputFormWidget extends StatelessWidget {
  final String headline;
  final String placeholder;
  final String path;
  final TextEditingController controller;
  final TextInputType type;
  const TextInputFormWidget(
      {super.key,
      required this.headline,
      required this.placeholder,
      required this.controller,
      this.type = TextInputType.text,
      required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(children: [
          Row(children: [
            Expanded(
                child: Text(headline,
                    style: const TextStyle(fontWeight: FontWeight.w600)))
          ]),
          const SizedBox(height: 10),
          CupertinoTextField(
              keyboardType: type,
              controller: controller,
              placeholderStyle: const TextStyle(color: fontGreyColor),
              placeholder: placeholder,
              decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: borderColor),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(12),
              prefix: Row(children: [
                const SizedBox(width: 12),
                Image(image: AssetImage(path), width: 20, height: 20)
              ]))
        ]));
  }
}
