import 'dart:async';

Timer startTimer(Duration initialDuration, Function(Duration) onTick) {
  Duration remainingTime = initialDuration;

  return Timer.periodic(const Duration(seconds: 1), (timer) {
    if (remainingTime.inSeconds > 0) {
      remainingTime = remainingTime - const Duration(seconds: 1);
      onTick(remainingTime);
    } else {
      timer.cancel();
    }
  });
}

String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String hours = twoDigits(duration.inHours);
  String minutes = twoDigits(duration.inMinutes.remainder(60));
  String seconds = twoDigits(duration.inSeconds.remainder(60));
  return "$hours:$minutes:$seconds";
}
