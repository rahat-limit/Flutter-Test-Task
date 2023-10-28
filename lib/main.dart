import 'package:flutter/material.dart';
import 'package:test_task/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

// Colors
const scaffoldBackgroundColor = Color(0xffFBFBFB);
const greyBackgroundColor = Color(0xffE7ECF0);
const fontGreyColor = Color(0xff677482);
const borderColor = Color(0xffA9B5C1);
const mainColor = Color(0xffEA560D);
const darkColor = Color(0xff172027);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: scaffoldBackgroundColor,
            elevation: 0.5,
            foregroundColor: darkColor,
          )),
      home: const HomeScreen(),
    );
  }
}
