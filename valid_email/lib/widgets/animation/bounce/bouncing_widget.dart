import 'package:flutter/material.dart';
import 'package:valid_email/features/animation/bouncing_controller.dart';

const double initialAnchorX = 200.0;
const double initialAnchorY = 200.0;
const double circleRadius = 20.0;
const double anchorRadius = 10.0;

class BouncingWidget extends StatefulWidget {
  const BouncingWidget({super.key});

  @override
  State<BouncingWidget> createState() => _BouncingWidgetState();
}

class _BouncingWidgetState extends State<BouncingWidget> with SingleTickerProviderStateMixin {
  late BouncingController _bouncingController;
  Offset _anchor = const Offset(initialAnchorX, initialAnchorY);

  @override
  void initState() {
    super.initState();
    _bouncingController = BouncingController(this);
    _bouncingController.startBouncing(_anchor, _anchor); // Start with the blue circle at the anchor
  }

  @override
  void dispose() {
    _bouncingController.dispose();
    super.dispose();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _anchor = details.localPosition;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    _bouncingController.startBouncing(_bouncingController.position, _anchor);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: AnimatedBuilder(
        animation: _bouncingController,
        builder: (context, child) {
          return CustomPaint(
            painter: _BouncingPainter(_bouncingController.position, _anchor),
            child: Container(),
          );
        },
      ),
    );
  }
}

class _BouncingPainter extends CustomPainter {
  final Offset position;
  final Offset anchor;

  _BouncingPainter(this.position, this.anchor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    canvas.drawCircle(position, circleRadius, paint);

    final anchorPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    canvas.drawCircle(anchor, anchorRadius, anchorPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}