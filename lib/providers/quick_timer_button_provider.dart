import 'package:flutter/material.dart';

class QuickTimerButtonProvider extends ChangeNotifier {
  int _minutes = 1;
  int _seconds = 30;

  get minutes => _minutes;

  get seconds => _seconds;

  set minutes(min) {
    _minutes = min;
    notifyListeners();
  }

  set seconds(sec) {
    _seconds = sec;
    notifyListeners();
  }

  String returnFormattedText() {
    String formatedMinutes = _minutes.toString().padLeft(2, "0");
    String formatedSeconds = _seconds.toString().padLeft(2, "0");
    return "$formatedMinutes:$formatedSeconds";
  }
}
