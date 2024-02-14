import 'dart:async';
import 'package:fitness_stopwatch_app/timer_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => TimerModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Stopwatch App',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 48, 49, 53)),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TimerModel>(
      builder: (context, timerModel, _) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Fitness stopwatch app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("1"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("2"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("3"),
                  ),
                ],
              ),
              Container(
                height: 250,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape
                      .circle, // this one is use for make the circle on ui.
                  border: Border.all(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    width: 5,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Provider.of<TimerModel>(context, listen: false)
                          .returnFormattedText(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed:
                              Provider.of<TimerModel>(context, listen: false)
                                  .pauseTimer,
                          tooltip: 'StartStop',
                          child: Icon(
                              Provider.of<TimerModel>(context, listen: false)
                                  .icon),
                        ),
                        FloatingActionButton(
                          onPressed:
                              Provider.of<TimerModel>(context, listen: false)
                                  .resetTimer,
                          tooltip: 'reset',
                          child: const Icon(Icons.restore),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("1:15"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("1:30"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("2:00"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
