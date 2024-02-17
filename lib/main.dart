import 'package:fitness_stopwatch_app/providers/timer_provider.dart';
import 'package:fitness_stopwatch_app/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimerProvider(70, 1, 3),
      child: MaterialApp(
        title: 'Fitness Stopwatch App',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 48, 49, 53)),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
