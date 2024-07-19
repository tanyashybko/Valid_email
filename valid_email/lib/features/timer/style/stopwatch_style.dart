import 'package:flutter/material.dart';

TextStyle stopwatchTextStyle() {
  return const TextStyle(
    fontSize: 48.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
}

ButtonStyle stopwatchButtonStyle() {
  return ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    textStyle: const TextStyle(fontSize: 18.0),
  );
}
