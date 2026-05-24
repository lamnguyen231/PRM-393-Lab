import 'package:flutter/material.dart';
import 'package:testxd/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

//rebuild basic flutter from the start
//21/05 HW:
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}