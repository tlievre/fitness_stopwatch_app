import 'dart:async';
import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  late Timer t;
  late int _milliseconds;

  int _counter = 0;
  bool _isPaused = true;
  IconData _icon = Icons.play_arrow;

  var sets = [0, 0, 1];

  IconData get icon => _icon;

  int get seconds => _milliseconds ~/ 1000;

  int get minutes => seconds ~/ 60;

  int get remainingSeconds => _counter ~/ 1000;

  static int convertInMilliseconds(int minutes, int seconds) {
    return minutes * 60000 + seconds * 1000;
  }

  set milliseconds(milliseconds) {
    _milliseconds = milliseconds;
    notifyListeners();
  }

  void rotate() {
    if (sets.isNotEmpty) {
      sets = sets.sublist(1)..addAll(sets.sublist(0, 1));
    }
  }

  TimerProvider(int minutes, int seconds) {
    _milliseconds = convertInMilliseconds(minutes, seconds);

    t = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      // This callback function check when the timer arrived to its end

      if (!_isPaused && (_counter < _milliseconds)) {
        _counter += 1;
      }

      if (_counter == _milliseconds) {
        resetTimer(resetSets: false);
        rotate();
      }
      notifyListeners();
    });
  }

  void pauseTimer() {
    if (_isPaused) {
      _isPaused = false;
      _icon = Icons.pause;
    } else {
      _isPaused = true;
      _icon = Icons.play_arrow;
    }
    notifyListeners();
  }

  void resetTimer({resetSets = true}) {
    _counter = 0;
    _isPaused = true;
    _icon = Icons.play_arrow;
    if (resetSets) sets = [0, 0, 1];
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
