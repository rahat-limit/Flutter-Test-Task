import 'package:flutter/material.dart';
import 'package:test_task/main.dart';

class LinkButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  const LinkButton({super.key, required this.text, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          TextButton(
              onPressed: callback,
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: mainColor),
              )),
        ],
      ),
    );
  }
}
