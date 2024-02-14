import 'dart:async';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class TimerModel extends ChangeNotifier {
  late Timer t;
  IconData icon = Icons.play_arrow;

  // actual
  static const int _milliseconds = 20000;

  int _counter = 0;

  bool isPaused = true;

  int get seconds => _milliseconds ~/ 1000;

  int get minutes => seconds ~/ 60;

  int get remainingSeconds => _counter ~/ 1000;

  TimerModel() {
    t = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      // This callback function check when the timer arrived to its end

      if (!isPaused && _counter < _milliseconds) {
        _counter += 1;
      }
      notifyListeners();
    });
  }

  void pauseTimer() {
    if (isPaused) {
      isPaused = false;
      icon = Icons.pause;
    } else {
      isPaused = true;
      icon = Icons.play_arrow;
    }
    notifyListeners();
  }

  void resetTimer() {
    _counter = 0;
    isPaused = true;
    icon = Icons.play_arrow;
    notifyListeners();
  }

  String returnFormattedText() {
    String milli = (-(_counter % 1000) % 1000)
        .toString()
        .padLeft(3, "0"); // this one for the miliseconds
    String sec = ((seconds - (_counter ~/ 1000)) % 60)
        .toString()
        .padLeft(2, "0"); // this is for the second
    String min = ((seconds - remainingSeconds) ~/ 60)
        .toString()
        .padLeft(2, "0"); // this is for the second

    return "$min:$sec:$milli";
  }
}
