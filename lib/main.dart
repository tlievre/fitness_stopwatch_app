import 'package:fitness_stopwatch_app/providers/timer_provider.dart';
import 'package:fitness_stopwatch_app/skeleton.dart';
import 'package:fitness_stopwatch_app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TimerProvider(70, 1, 1, 3)),
        ChangeNotifierProvider(create: (context) => ThemeProvider())
      ],
      child: MaterialApp(
        title: 'Fitness Stopwatch App',
        //theme: MyAppThemes.lightTheme,
        //darkTheme: MyAppThemes.darkTheme,
        // themeMode: ThemeMode.system,
        home: const MyHomePage(),
      ),
    );
  }
}
