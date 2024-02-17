import 'package:flutter/material.dart';
import 'package:fitness_stopwatch_app/providers/timer_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            const SetTrackerCards(),
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

class SetTrackerCards extends StatelessWidget {
  const SetTrackerCards({
    super.key,
  });

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

    Row buildRowofCardWidgets() {
      List<Widget> list = [];
      for (final (index, cardValue) in timerProvider.sets.indexed) {
        list.add(
          Card(
            color: currentSet(cardValue),
            elevation: 70,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text((index + 1).toString(), style: style),
            ),
          ),
        );
      }
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: list);
    }

    return buildRowofCardWidgets();
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
                TimerProvider.convertInMilliseconds(0, 5);
          },
          child: Text("0:5"),
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