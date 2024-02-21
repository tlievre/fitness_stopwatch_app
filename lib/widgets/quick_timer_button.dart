import 'package:fitness_stopwatch_app/providers/timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            timerProvider.resetTimer(resetSets: false);
            timerProvider.milliseconds =
                TimerProvider.convertInMilliseconds(0, 5);
          },
          child: const Text("0:5"),
        ),
        ElevatedButton(
          onPressed: () {
            timerProvider.resetTimer(resetSets: false);
            timerProvider.milliseconds =
                TimerProvider.convertInMilliseconds(1, 30);
          },
          child: const Text("1:30"),
        ),
        ElevatedButton(
          onPressed: () {
            timerProvider.resetTimer(resetSets: false);
            timerProvider.milliseconds =
                TimerProvider.convertInMilliseconds(2, 0);
          },
          child: const Text("2:00"),
        ),
      ],
    );
  }
}
