import 'package:fitness_stopwatch_app/providers/timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
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
          onLongPress: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog(context),
            );
          },
          onPressed: () {
            timerProvider.resetTimer(resetSets: false);
            timerProvider.milliseconds =
                TimerProvider.convertInMilliseconds(0, 5);
          },
          child: const Text("0:5"),
        ),
        ElevatedButton(
          onLongPress: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog(context),
            );
          },
          onPressed: () {
            timerProvider.resetTimer(resetSets: false);
            timerProvider.milliseconds =
                TimerProvider.convertInMilliseconds(1, 30);
          },
          child: const Text("1:30"),
        ),
        ElevatedButton(
          onLongPress: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog(context),
            );
          },
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

Widget _buildPopupDialog(BuildContext context) {
  int value = 1;
  return AlertDialog(
    title: const Text('Set timer shortcut'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            NumberPicker(
              value: value,
              minValue: 0,
              maxValue: 60,
              onChanged: (value) => print(value),
            ),
            const Text(":"),
            NumberPicker(
              value: value,
              minValue: 0,
              maxValue: 60,
              onChanged: (value) => print(value),
            ),
          ],
        ),
      ],
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Close'),
      ),
    ],
  );
}
