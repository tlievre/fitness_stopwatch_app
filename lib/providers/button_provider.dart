import 'package:flutter/material.dart';

class ButtonProvider extends ChangeNotifier {
  late int _minutes;
  late int _seconds;

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
}
