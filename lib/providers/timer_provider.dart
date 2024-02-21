import 'dart:async';
import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  late Timer t;
  late int _milliseconds;
  late List<int> sets; //this list enable to count sets of each exercice

  int _counter = 0;
  bool _isPaused = true;
  IconData _icon = Icons.play_arrow;

  //getters
  IconData get icon => _icon;

  double get progressPourcentage => (_milliseconds - _counter) / _milliseconds;

  //setters
  set milliseconds(milliseconds) {
    _milliseconds = milliseconds;
    notifyListeners();
  }

  TimerProvider(int minutes, int seconds, int numberSets) {
    _milliseconds = convertInMilliseconds(minutes, seconds);
    sets = List<int>.filled(numberSets - 1, 0, growable: true)..add(1);

    t = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      // This callback function check when the timer arrived to its end

      if (!_isPaused && (_counter < _milliseconds)) {
        _counter += 500;
      }

      if (_counter == _milliseconds) {
        resetTimer(resetSets: false);
        rotate();
      }
      notifyListeners();
    });
  }

  //usefull public static public methods
  static int convertInMilliseconds(int minutes, int seconds) {
    return minutes * 60000 + seconds * 1000;
  }

  // Count remaining number of sets
  void rotate() {
    if (sets.isNotEmpty) {
      sets = sets.sublist(1)..addAll(sets.sublist(0, 1));
    }
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

  // reset timer and the optionnaly the number of sets
  void resetTimer({resetSets = true}) {
    _counter = 0;
    _isPaused = true;
    _icon = Icons.play_arrow;
    if (resetSets) {
      sets = List<int>.filled(sets.length - 1, 0, growable: true)..add(1);
    }
    notifyListeners();
  }

  String returnFormattedText() {
    String sec = (((_milliseconds - _counter) ~/ 1000) % 60)
        .toString()
        .padLeft(2, "0"); // this is for the second
    String min = (((_milliseconds - _counter) ~/ 60000) % 60)
        .toString()
        .padLeft(2, "0"); // this is for the second
    return "$min:$sec";
  }
}
