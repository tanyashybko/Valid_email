import 'package:flutter/material.dart';
import 'package:valid_email/widgets/input_example_screen.dart';
import '../../const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: InputExampleScreen(),
    );
  }
}
