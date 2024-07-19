import 'dart:async';

class StopwatchLogic {
  Duration elapsed = Duration.zero;
  late Timer _timer;
  bool isRunning = false;

  void start(Function(Duration) onTick) {
    if (!isRunning) {
      isRunning = true;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        elapsed = elapsed + const Duration(seconds: 1);
        onTick(elapsed);
      });
    }
  }

  void stop() {
    if (isRunning) {
      _timer.cancel();
      isRunning = false;
    }
  }

  void reset(Function(Duration) onTick) {
    stop();
    elapsed = Duration.zero;
    onTick(elapsed);
  }
}

String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String hours = twoDigits(duration.inHours);
  String minutes = twoDigits(duration.inMinutes.remainder(60));
  String seconds = twoDigits(duration.inSeconds.remainder(60));
  return "$hours:$minutes:$seconds";
}
