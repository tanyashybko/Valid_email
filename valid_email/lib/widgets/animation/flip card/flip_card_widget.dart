import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../features/animation/flip_card_controller.dart';

class FlipCardWidget extends StatefulWidget {
  final String text;
  final String imageAssetPath;

  const FlipCardWidget(
      {super.key, required this.text, required this.imageAssetPath});

  @override
  State<FlipCardWidget> createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget>
    with SingleTickerProviderStateMixin {
  late FlipCardController _flipCardController;

  @override
  void initState() {
    super.initState();
    _flipCardController = FlipCardController(this);
  }

  @override
  void dispose() {
    _flipCardController.dispose();
    super.dispose();
  }

  void _flipCard() {
    _flipCardController.flip();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedBuilder(
        animation: _flipCardController.flipAnimation,
        builder: (context, _) {
          bool isFront = _flipCardController.flipAnimation.value < 0.5;
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(
                _flipCardController.flipAnimation.value * math.pi),
            child: Container(
              width: 1200,
              height: 300,
              color: Colors.white,
              alignment: Alignment.center,
              child: isFront ? Text(
                widget.text,
                style: const TextStyle(fontSize: 24),
              )
                  : Image.asset(
                widget.imageAssetPath,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
