import 'dart:async';

import 'package:flutter/material.dart';
import 'package:study_app/models/pmd_data.dart';

class PmdStateProvider extends ChangeNotifier {
  PmdStateProvider({required this.pmdData}) {
    remaining = Duration(minutes: pmdData.focusTime).inSeconds;
  }

  bool focusing = true;

  PmdData pmdData;
  Timer? _timer;

  int remaining = 0;

  bool isPlaying = false;

  void focus() {
    focusing = true;
    remaining = Duration(minutes: pmdData.focusTime).inSeconds;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remaining == 0) {
        break_();
      }
      remaining = remaining - 1;
      notifyListeners();
    });

    isPlaying = true;
    notifyListeners();
  }

  void break_() {
    focusing = false;
    remaining = Duration(minutes: pmdData.breakTime).inSeconds;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remaining == 0) {
        focus();
      }

      remaining = remaining - 1;
      notifyListeners();
    });

    isPlaying = true;
    notifyListeners();
  }

  void play() {
    _timer?.cancel();
    _timer = Timer.periodic(
        const Duration(
          seconds: 1,
        ), (timer) {
      remaining = remaining - 1;
      if (remaining == 0) {
        focusing ? break_() : play();
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
