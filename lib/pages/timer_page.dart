import 'package:fitness_stopwatch_app/widgets/quick_timer_button.dart';
import 'package:fitness_stopwatch_app/widgets/set_tracker_cards.dart';
import 'package:fitness_stopwatch_app/widgets/timer_circle_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:fitness_stopwatch_app/providers/timer_provider.dart';
import 'package:provider/provider.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    var timerProvider = context.watch<TimerProvider>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SetTrackerCards(),
            const SizedBox(height: 10),
            Stack(alignment: Alignment.center, children: [
              const TimerCircleProgressBar(),
              Column(
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
                        heroTag: null,
                        onPressed: timerProvider.pauseTimer,
                        tooltip: 'StartStop',
                        child: Icon(timerProvider.icon),
                      ),
                      FloatingActionButton(
                        heroTag: null,
                        onPressed: timerProvider.resetTimer,
                        tooltip: 'reset',
                        child: const Icon(Icons.restore),
                      ),
                    ],
                  ),
                ],
              ),
            ]),
            const SizedBox(height: 10),
            const QuickTimerButton(),
          ],
        ),
      ),
    );
  }
}
