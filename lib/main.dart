import 'package:flutter/material.dart';
import 'package:testxd/lab/lab4/home_menu.dart';

void main() {
  // Điểm khởi đầu của ứng dụng lab.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp cung cấp theme và điều hướng cho toàn bộ lab.
    return MaterialApp(
      title: 'Lab 4 - Flutter UI Fundamentals',
      debugShowCheckedModeBanner: false,
      // Theme gốc của app, các màn hình con sẽ kế thừa màu này.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeMenu(),
    );
  }
}
