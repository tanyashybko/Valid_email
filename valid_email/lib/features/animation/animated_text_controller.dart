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

    sizeAnimation = Tween<double>(begin: 0, end: 2*math.pi).animate(
      CurvedAnimation(parent: controller, curve: Curves.linear),
    );

    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.red).animate(
      CurvedAnimation(parent: controller, curve: Curves.linear),
    );
  }

  double get animatedSize => (30 + 20 * math.sin(controller.value));

  void dispose() {
    controller.dispose();
  }
}
