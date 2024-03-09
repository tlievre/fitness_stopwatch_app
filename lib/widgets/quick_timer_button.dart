import 'package:fitness_stopwatch_app/providers/quick_timer_button_provider.dart';
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
    var quickTimerButtonProvider = context.watch<QuickTimerButtonProvider>();

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
            timerProvider.milliseconds = TimerProvider.convertInMilliseconds(
                quickTimerButtonProvider.minutes,
                quickTimerButtonProvider.seconds);
          },
          child: Text(quickTimerButtonProvider.returnFormattedText()),
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
            timerProvider.milliseconds = TimerProvider.convertInMilliseconds(
                quickTimerButtonProvider.minutes,
                quickTimerButtonProvider.seconds);
          },
          child: Text(quickTimerButtonProvider.returnFormattedText()),
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
            timerProvider.milliseconds = TimerProvider.convertInMilliseconds(
                quickTimerButtonProvider.minutes,
                quickTimerButtonProvider.seconds);
          },
          child: Text(quickTimerButtonProvider.returnFormattedText()),
        ),
      ],
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  var button = context.watch<QuickTimerButtonProvider>();
  return AlertDialog(
    title: const Text('Set timer shortcut'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            NumberPicker(
              value: button.minutes,
              minValue: 0,
              maxValue: 60,
              onChanged: (value) => button.minutes = value,
            ),
            const Text(":"),
            NumberPicker(
              value: button.seconds,
              minValue: 0,
              maxValue: 60,
              onChanged: (value) => button.seconds = value,
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
