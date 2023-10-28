import 'package:flutter/material.dart';
import 'package:test_task/screens/order_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: const Text('Navigate to Ordering'),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const OrderScreen(
                        restorationId: 'main',
                      )));
        },
      )),
    );
  }
}
