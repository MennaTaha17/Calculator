import 'package:calculator_app/screens/calculator_screen.dart';
import 'package:calculator_app/themes/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: AppTheme.appTheme,
      home:CalculatorScreen(),
    );
  }
}