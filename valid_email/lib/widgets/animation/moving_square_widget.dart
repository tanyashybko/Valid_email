import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../features/animation/moving_square.dart';

class MovingSquareWidget extends StatefulWidget {
  const MovingSquareWidget({super.key});

  @override
  State<MovingSquareWidget> createState() => _MovingSquareWidgetState();
}

class _MovingSquareWidgetState extends State<MovingSquareWidget>
    with SingleTickerProviderStateMixin {
  late MovingSquareController _movingSquareController;

  @override
  void initState() {
    super.initState();
    _movingSquareController = MovingSquareController(this);
  }

  @override
  void dispose() {
    _movingSquareController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _movingSquareController.controller,
      builder: (context, child) {
        double height = MediaQuery.of(context).size.height;
        double squareSize = 100.0;
        double position = (math.sin(_movingSquareController.controller.value * 2 * math.pi) + 1) / 2;

        return Stack(
          children: [
            Positioned(
              top: position * (height - squareSize),
              left: MediaQuery.of(context).size.width / 2 - squareSize / 2,
              child: Transform.rotate(
                angle: _movingSquareController.rotationAnimation.value,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.purple,
                  ),
                  child: SizedBox(
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
