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
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  void _startTimer() {
    t = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {
        // This callback function check when the timer arrived to its end
        if (stopwatch!.elapsed.inSeconds >= 10) {
          stopwatch!.stop();
          stopwatch!.reset();
        }
      });
    });
  }

  String returnFormattedText() {
    var minuteur = 9;
    var milli = stopwatch!.elapsed.inMilliseconds;

    String milliseconds = (1000 - (milli % 1000))
        .toString()
        .padLeft(3, "0"); // this one for the miliseconds
    String seconds = (minuteur - ((milli ~/ 1000) % 60))
        .toString()
        .padLeft(2, "0"); // this is for the second

    return "$seconds:$milliseconds";
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
                  color: Color(0xff0395eb),
                  width: 4,
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
          ],
        ),
      ),
    );
  }
}
