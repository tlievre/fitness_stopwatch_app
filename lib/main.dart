import 'package:fitness_stopwatch_app/timer_provider.dart';
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
      create: (context) => TimerProvider(1, 1),
      child: MaterialApp(
        title: 'Fitness Stopwatch App',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 48, 49, 53)),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onSecondary,
    );

    Color currentSet(int value) {
      return (value == 1)
          ? theme.colorScheme.primary
          : theme.colorScheme.secondary;
    }

    var timerProvider = context.watch<TimerProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Fitness stopwatch app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: currentSet(timerProvider.sets[0]),
                  elevation: 70,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("1", style: style),
                  ),
                ),
                Card(
                  color: currentSet(timerProvider.sets[1]),
                  elevation: 70,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("2", style: style),
                  ),
                ),
                Card(
                  color: currentSet(timerProvider.sets[2]),
                  elevation: 70,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("3", style: style),
                  ),
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
                    timerProvider.returnFormattedText(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: timerProvider.pauseTimer,
                        tooltip: 'StartStop',
                        child: Icon(timerProvider.icon),
                      ),
                      FloatingActionButton(
                        onPressed: timerProvider.resetTimer,
                        tooltip: 'reset',
                        child: const Icon(Icons.restore),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const QuickTimerButton()
          ],
        ),
      ),
    );
  }
}

class QuickTimerButton extends StatelessWidget {
  const QuickTimerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var timerProvider = context.watch<TimerProvider>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            timerProvider.milliseconds =
                TimerProvider.convertInMilliseconds(0, 20);
          },
          child: Text("0:20"),
        ),
        ElevatedButton(
          onPressed: () {
            timerProvider.milliseconds =
                TimerProvider.convertInMilliseconds(1, 30);
          },
          child: Text("1:30"),
        ),
        ElevatedButton(
          onPressed: () {
            timerProvider.milliseconds =
                TimerProvider.convertInMilliseconds(2, 0);
          },
          child: Text("2:00"),
        ),
      ],
    );
  }
}
