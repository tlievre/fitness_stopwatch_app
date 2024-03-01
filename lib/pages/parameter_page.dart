import 'package:fitness_stopwatch_app/providers/theme_provider.dart';
import 'package:fitness_stopwatch_app/providers/timer_provider.dart';
import 'package:fitness_stopwatch_app/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class ParameterPage extends StatelessWidget {
  const ParameterPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    var themeProvider = context.watch<ThemeProvider>();
    var timerProvider = context.watch<TimerProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Parameter')),
      body: ListView(
        children: [
          CustomListTile(
            height: 100,
            leading: Icon(Icons.dark_mode, size: 50),
            title: Text('Dark mode'),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (isOn) {
                isOn
                    ? themeProvider.toggleTheme()
                    : themeProvider.toggleTheme();
              },
            ),
          ),
          CustomListTile(
            height: 250,
            leading: Icon(Icons.replay, size: 50),
            title: Text('Sets number'),
            trailing: NumberPicker(
              value: timerProvider.setNumber,
              minValue: 1,
              maxValue: 4,
              onChanged: (value) => timerProvider.setNewNumberSets(value),
            ),
          ),
        ],
      ),
    );
  }
}
