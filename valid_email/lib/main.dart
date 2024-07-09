import 'package:flutter/material.dart';
import 'widgets/email_valid_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Input Example',
      home: MyInputPage(),
    );
  }
}
