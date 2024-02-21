import 'package:fitness_stopwatch_app/providers/timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimerCircleProgressBar extends StatelessWidget {
  const TimerCircleProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var timerProvider = context.watch<TimerProvider>();
    return SizedBox(
      height: 200.0,
      width: 200.0,
      child: CircularProgressIndicator(
        value: timerProvider.progressPourcentage,
        strokeWidth: 8.0,
      ),
    );
  }
}
