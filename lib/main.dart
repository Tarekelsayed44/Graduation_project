import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import 'screens/login_screen/gg.dart';
import 'screens/login_screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Pick Park',
      home: first(),
    );
  }
}
