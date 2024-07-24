import 'package:flutter/material.dart';

class MovingSquareController {
  late AnimationController controller;
  late Animation<double> rotationAnimation;
  late Animation<double> positionAnimation;

  MovingSquareController(TickerProvider vsync) {
    controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: vsync,
    )..repeat();

    rotationAnimation = Tween<double>(begin: 0, end: 2 * 3.14159).animate(
      CurvedAnimation(parent: controller, curve: Curves.linear),
    );

    positionAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );
  }

  void dispose() {
    controller.dispose();
  }
}
