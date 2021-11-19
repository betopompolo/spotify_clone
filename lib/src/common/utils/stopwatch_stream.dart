import 'dart:async';

Stream<Duration> stopwatchStream() {
  const tickDuration = Duration(milliseconds: 200);
  late StreamController<Duration> controller;
  Timer? timer;
  Duration progress = tickDuration;

  void handleTick(Timer timer) {
    progress += tickDuration;
    controller.add(progress);
  }

  void start() {
    timer = Timer.periodic(tickDuration, handleTick);
  }

  void stop() {
    timer?.cancel();
    timer = null;
  }

  controller = StreamController<Duration>(
    onListen: start,
    onPause: stop,
    onResume: start,
    onCancel: stop,
  );

  return controller.stream;
}
