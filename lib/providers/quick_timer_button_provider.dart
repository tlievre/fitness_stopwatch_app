import 'package:fitness_stopwatch_app/models/quick_timer.dart';
import 'package:flutter/material.dart';

class QuickTimerButtonProvider extends ChangeNotifier {
  List<QuickTimer> quickTimer = [
    QuickTimer(0, 5),
    QuickTimer(1, 30),
    QuickTimer(2, 0)
  ];

  void setMinutes(min, quickTimerIndex) {
    quickTimer[quickTimerIndex].minutes = min;
    notifyListeners();
  }

  void setSeconds(sec, quickTimerIndex) {
    quickTimer[quickTimerIndex].seconds = sec;
    notifyListeners();
  }
}
