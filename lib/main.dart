import 'package:calculator/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main(List<String> args) {
  runApp(CalculaterApp());
}

class CalculaterApp extends StatelessWidget {
  const CalculaterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
