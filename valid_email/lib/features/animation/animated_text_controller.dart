import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedTextController {
  late AnimationController controller;
  late Animation<double> sizeAnimation;
  late Animation<Color?> colorAnimation;

  AnimatedTextController(TickerProvider vsync) {
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: vsync,
    )..repeat(reverse: true);

    sizeAnimation = Tween<double>(begin: 10, end: 30).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.red).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );
  }

  double get animatedSize => (10 + 20 * math.sin(controller.value * 2 * math.pi));

  void dispose() {
    controller.dispose();
  }
}
