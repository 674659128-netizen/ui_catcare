import 'package:flutter/material.dart';
import 'package:ui_catcare/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CatCare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF06A55)),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
