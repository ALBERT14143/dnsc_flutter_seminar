import 'package:flutter/material.dart';
import 'package:flutter_seminar/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff005d00)),
        useMaterial3: true
      ),
      home: const HomeScreen()
    );
  }
}
