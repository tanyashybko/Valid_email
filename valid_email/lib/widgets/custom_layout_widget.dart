import 'package:flutter/material.dart';

class CustomLayoutWidget extends StatelessWidget {
  final Color color;
  final String text;

  const CustomLayoutWidget({
    super.key,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            text,
            style: const TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
