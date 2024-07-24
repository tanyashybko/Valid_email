import 'package:flutter/material.dart';
import '../features/animation/moving_square.dart';

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
        return Stack(
          children: [
            Positioned(
              top: _movingSquareController.positionAnimation.value *
                  (MediaQuery.of(context).size.height - 100),
              left: MediaQuery.of(context).size.width / 2 - 50,
              child: Transform.rotate(
                angle: _movingSquareController.rotationAnimation.value,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
