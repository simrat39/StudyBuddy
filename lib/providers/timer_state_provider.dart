import 'dart:async';

import 'package:flutter/material.dart';

class TimerStateProvider extends ChangeNotifier {
  TimerStateProvider({required this.duration}) {
    remaining = duration?.inSeconds;
  }

  Duration? duration;
  Timer? _timer;
  int? remaining;

  bool isPlaying = false;

  void play() {
    _timer = Timer.periodic(
        const Duration(
          seconds: 1,
        ), (timer) {
      remaining = remaining! - 1;
      if (remaining == 0) {
        _timer?.cancel();
      }
      notifyListeners();
    });
  }

  void pause() {
    _timer?.cancel();
  }

  void toggle() {
    if (isPlaying) {
      pause();
    } else {
      play();
    }
    isPlaying = !isPlaying;
    notifyListeners();
  }
}
