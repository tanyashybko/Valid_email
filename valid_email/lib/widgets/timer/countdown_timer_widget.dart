import 'dart:async';

import 'package:flutter/material.dart';
import 'package:valid_email/l10n/l10n.dart';
import '../../features/timer/logic/countdown_timer_logic.dart';
import '../../features/timer/style/countdown_timer_style.dart';
import '../../localization/language_switcher.dart';

class CountdownTimer extends StatefulWidget {
  final Duration duration;

  const CountdownTimer({super.key, required this.duration});

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Duration remainingTime;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    remainingTime = widget.duration;
    timer = startTimer(remainingTime, (newTime) {
      setState(() {
        remainingTime = newTime;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.timerTitle),
        actions: const [
          LanguageSwitcher(),
        ],
      ),
      body: Center(
        child: Text(
          formatDuration(remainingTime),
          style: countdownTimerTextStyle(),
        ),
      ),
    );
  }
}
