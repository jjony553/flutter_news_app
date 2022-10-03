import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'PlayfairDisplay',
        primarySwatch: Colors.grey,
      ),
      home: const MainScreen(),
    );
  }
}
