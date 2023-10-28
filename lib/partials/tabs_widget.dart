import 'package:flutter/material.dart';
import 'package:test_task/main.dart';

class TabsWidget extends StatelessWidget {
  final String headline;
  final VoidCallback callback;
  final bool mode;
  const TabsWidget(
      {super.key,
      this.headline = 'Sender details',
      required this.callback,
      required this.mode});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        Row(
          children: [
            Expanded(
                child: Text(
              headline,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ))
          ],
        ),
        const SizedBox(height: 15),
        Row(children: [
          Expanded(
              child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              padding: const EdgeInsets.all(10),
              backgroundColor: mode ? mainColor : greyBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(36), // <-- Radius
              ),
            ),
            onPressed: callback,
            child: Center(
                child: Text(
              'Add address',
              style: TextStyle(
                  color: mode ? Colors.white : const Color(0xff919EAB)),
            )),
          )),
          const SizedBox(width: 10),
          Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    padding: const EdgeInsets.all(10),
                    backgroundColor: mode ? greyBackgroundColor : mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36), // <-- Radius
                    ),
                  ),
                  onPressed: callback,
                  child: Center(
                      child: Text(
                    'Select address',
                    style: TextStyle(
                        color: mode ? const Color(0xff919EAB) : Colors.white),
                  ))))
        ])
      ]),
    );
  }
}
