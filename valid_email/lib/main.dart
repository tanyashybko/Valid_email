import 'package:flutter/material.dart';
import 'package:valid_email/widgets/input_example_screen.dart';
import '../../const.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: InputExampleScreen(),
    );
  }
}
