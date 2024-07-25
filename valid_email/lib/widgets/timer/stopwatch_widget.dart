import 'package:flutter/material.dart';
import 'package:valid_email/l10n/l10n.dart';

import '../../features/timer/logic/stopwatch_logic.dart';
import '../../features/timer/style/stopwatch_style.dart';
import '../../localization/language_switcher.dart';

class StopwatchWidget extends StatefulWidget {
  const StopwatchWidget({super.key});

  @override
  State<StopwatchWidget> createState() => _StopwatchWidgetState();
}

class _StopwatchWidgetState extends State<StopwatchWidget> {
  late StopwatchLogic _stopwatchLogic;
  Duration _elapsedTime = Duration.zero;

  @override
  void initState() {
    super.initState();
    _stopwatchLogic = StopwatchLogic();
  }

  void _updateElapsedTime(Duration newTime) {
    setState(() {
      _elapsedTime = newTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.stopwatchTitle),
        actions: const [
          LanguageSwitcher(),
        ],
      ),
      body: IntrinsicHeight(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formatDuration(_elapsedTime),
              style: stopwatchTextStyle(),
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_stopwatchLogic.isRunning) {
                      _stopwatchLogic.stop();
                    } else {
                      _stopwatchLogic.start(_updateElapsedTime);
                    }
                    setState(() {});
                  },
                  style: stopwatchButtonStyle(),
                  child: Text(_stopwatchLogic.isRunning ? l10n.stopButton : l10n.startButton),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _stopwatchLogic.reset(_updateElapsedTime);
                  },
                  style: stopwatchButtonStyle(),
                  child: Text(l10n.resetButton),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
