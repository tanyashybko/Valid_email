import 'package:flutter/material.dart';

class FlipCardController {
  late AnimationController controller;
  late Animation<double> flipAnimation;

  FlipCardController(TickerProvider vsync) {
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: vsync,
    );
    flipAnimation = Tween<double>(begin: 0, end: 1).animate(controller);
  }

  void flip() {
    if (controller.isCompleted) {
      controller.reverse();
    } else {
      controller.forward();
    }
  }

  void dispose() {
    controller.dispose();
  }
}
