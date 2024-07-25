import 'package:flutter/material.dart';
import 'package:valid_email/l10n/l10n.dart';
import '../../features/animation/flip_card_controller.dart';
import '../../localization/language_switcher.dart';

class FlipCardWidget extends StatefulWidget {
  final String text;
  final String imageAssetPath; // Изменено на imageAssetPath

  const FlipCardWidget({super.key, required this.text, required this.imageAssetPath});

  @override
  State<FlipCardWidget> createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget> with SingleTickerProviderStateMixin {
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
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.flipCardTitle),
        actions: const [
          LanguageSwitcher(),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: _flipCard,
          child: AnimatedBuilder(
            animation: _flipCardController.flipAnimation,
            builder: (context, child) {
              bool isFront = _flipCardController.flipAnimation.value < 0.5;
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(_flipCardController.flipAnimation.value * 3.14),
                child: isFront
                    ? Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: Text(
                    widget.text,
                    style: const TextStyle(fontSize: 24),
                  ),
                )
                    : Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(3.14),
                  child: Image.asset(
                    widget.imageAssetPath,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
