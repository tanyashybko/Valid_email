import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

const double mass = 1.0;
const double stiffness = 100.0;
const double damping = 10.0;
const int animationDuration = 2000; // milliseconds

class BouncingController extends ChangeNotifier {
  late AnimationController _controller;
  late SpringSimulation _xSimulation;
  late SpringSimulation _ySimulation;

  Offset _position = Offset.zero;
  Offset get position => _position;

  BouncingController(TickerProvider vsync) {
    _controller = AnimationController(vsync: vsync)
      ..addListener(_onTick)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _position = _endPosition;
          notifyListeners();
        }
      });
  }

  late Offset _endPosition;

  void _onTick() {
    _position = Offset(
      _xSimulation.x(_controller.value),
      _ySimulation.x(_controller.value),
    );
    notifyListeners();
  }

  void startBouncing(Offset startPosition, Offset anchor) {
    _position = startPosition;
    _endPosition = anchor;

    const spring =  SpringDescription(
      mass: mass,
      stiffness: stiffness,
      damping: damping,
    );

    _xSimulation = SpringSimulation(
      spring,
      startPosition.dx,
      anchor.dx,
      0,
    );

    _ySimulation = SpringSimulation(
      spring,
      startPosition.dy,
      anchor.dy,
      0,
    );

    _controller.duration = const Duration(milliseconds: animationDuration);
    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}