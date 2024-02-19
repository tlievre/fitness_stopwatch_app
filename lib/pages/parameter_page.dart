import 'package:fitness_stopwatch_app/providers/theme_provider.dart';
import 'package:fitness_stopwatch_app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ParameterPage extends StatelessWidget {
  const ParameterPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    var themeProvider = context.watch<ThemeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Dark theme'),
        actions: <Widget>[
          Switch(
            value: isDarkMode,
            onChanged: (isOn) {
              isOn ? themeProvider.toggleTheme() : themeProvider.toggleTheme();
            },
          ),
        ],
      ),
    );
  }
}
