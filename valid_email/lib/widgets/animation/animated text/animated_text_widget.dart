import 'package:flutter/material.dart';
import 'package:valid_email/l10n/l10n.dart';
import '../../../features/animation/animated_text_controller.dart';
import '../../../localization/language_switcher.dart';

class AnimatedTextWidget extends StatefulWidget {
  const AnimatedTextWidget({super.key});

  @override
  State<AnimatedTextWidget> createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget>
    with SingleTickerProviderStateMixin {
  late AnimatedTextController _animatedTextController;

  @override
  void initState() {
    super.initState();
    _animatedTextController = AnimatedTextController(this);
  }

  @override
  void dispose() {
    _animatedTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.animatedText),
        actions: const [
          LanguageSwitcher(),
        ],
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animatedTextController.controller,
          builder: (context, child) {
            return Text(
              l10n.helloFlutter,
              style: TextStyle(
                fontSize: _animatedTextController.animatedSize,
                color: _animatedTextController.colorAnimation.value,
              ),
            );
          },
        ),
      ),
    );
  }
}
