import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      home: const MyHomePage(title: 'Fitness stopwatch app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Stopwatch? stopwatch;
  Timer? t;
  IconData? icon;

  var chosenMinutes = 2;
  var chosenSeconds = 0;

  @override
  void initState() {
    super.initState();

    stopwatch = Stopwatch();
    icon = Icons.play_arrow;
    _startTimer();
  }

  void handleStartStop() {
    if (stopwatch!.isRunning) {
      stopwatch!.stop();
      icon = Icons.play_arrow;
    } else {
      stopwatch!.start();
      icon = Icons.pause;
    }
  }

  void setTimer(minutes, seconds) {
    chosenMinutes = minutes;
    chosenSeconds = seconds;
  }

  void _startTimer() {
    t = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {
        // This callback function check when the timer arrived to its end
        if (stopwatch!.elapsed.inSeconds >=
            (chosenMinutes * 60 + chosenSeconds)) {
          handleStartStop();
          stopwatch!.reset();
        }
      });
    });
  }

  String returnFormattedText() {
    var milli = stopwatch!.elapsed.inMilliseconds;
    var sec = stopwatch!.elapsed.inSeconds;

    String milliseconds = (-(milli % 1000) % 1000)
        .toString()
        .padLeft(3, "0"); // this one for the miliseconds
    String seconds = ((chosenSeconds - (milli ~/ 1000)) % 60)
        .toString()
        .padLeft(2, "0"); // this is for the second
    String minutes = ((chosenMinutes * 60 + chosenSeconds - sec) ~/ 60)
        .toString()
        .padLeft(2, "0"); // this is for the second

    return "$minutes:$seconds:$milliseconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                    returnFormattedText(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: handleStartStop,
                        tooltip: 'StartStop',
                        child: Icon(icon),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          handleStartStop();
                          stopwatch!.reset();
                        },
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
                  onPressed: () {
                    setTimer(1, 15);
                  },
                  child: Text("1:15"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setTimer(1, 30);
                  },
                  child: Text("1:30"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setTimer(2, 00);
                  },
                  child: Text("2:00"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SavedTimerButton extends StatelessWidget {
  const SavedTimerButton({
    super.key,
    required this.minutes,
    required this.seconds,
  });
  final int minutes;
  final int seconds;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text("$minutes:$seconds"),
    );
  }
}
