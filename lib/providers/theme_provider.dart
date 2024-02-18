import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  void toggleTheme(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
