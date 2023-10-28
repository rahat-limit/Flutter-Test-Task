import 'package:flutter/material.dart';
import 'package:test_task/main.dart';

class SubmitButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  const SubmitButtonWidget(
      {super.key, this.text = 'Next Step', required this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(18),
                    backgroundColor: mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                onPressed: callback,
                child: Text(
                  text,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                )),
          ),
        ],
      ),
    );
  }
}
