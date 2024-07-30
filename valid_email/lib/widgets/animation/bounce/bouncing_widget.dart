import 'package:flutter/material.dart';
import 'package:valid_email/features/animation/bouncing_controller.dart';

class BouncingWidget extends StatefulWidget {
  const BouncingWidget({super.key});

  @override
  State<BouncingWidget> createState() => _BouncingWidgetState();
}

class _BouncingWidgetState extends State<BouncingWidget> with SingleTickerProviderStateMixin {
  late final BouncingController _bouncingController;

  @override
  void initState() {
    super.initState();
    _bouncingController = BouncingController(vsync: this);
  }

  @override
  void dispose() {
    _bouncingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _bouncingController.anchorPosition = details.localPosition;
        });
      },
      child: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: _bouncingController.controller,
            builder: (context, child) {
              return Positioned(
                left: _bouncingController.anchorPosition.dx - 25,
                top: _bouncingController.anchorPosition.dy - 25,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _bouncingController.controller,
            builder: (context, child) {
              return Positioned(
                left: _bouncingController.animation.value.dx - 25,
                top: _bouncingController.animation.value.dy - 25,
                child: child ?? _buildDraggableWidget(),
              );
            },
            child: Draggable(
              feedback: _buildDraggableWidget(),
              childWhenDragging: Container(),
              onDragEnd: (details) {
                setState(() {
                  _bouncingController.runSpringAnimation();
                });
              },
              child: _buildDraggableWidget(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDraggableWidget() {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
    );
  }
}