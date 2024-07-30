import 'package:flutter/material.dart';

class BouncingController {
  Offset _widgetPosition = const Offset(100, 100);
  Offset _anchorPosition = const Offset(550, 275);
  late final AnimationController controller;
  late final Animation<Offset> animation;

  BouncingController({required TickerProvider vsync}) {
    controller = AnimationController(vsync: vsync, duration: const Duration(milliseconds: 1000));
    _updateAnimation();
  }

  Offset get widgetPosition => _widgetPosition;
  Offset get anchorPosition => _anchorPosition;

  set anchorPosition(Offset position) {
    _anchorPosition = position;
    _updateAnimation();
    runSpringAnimation();
  }

  void _updateAnimation() {
    animation = Tween<Offset>(
      begin: _widgetPosition,
      end: _anchorPosition,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.bounceOut,
    ));
  }

  void runSpringAnimation() {
    controller
      ..reset()
      ..forward().then((_) {
        _widgetPosition = _anchorPosition;
      });
  }

  void dispose() {
    controller.dispose();
  }
}