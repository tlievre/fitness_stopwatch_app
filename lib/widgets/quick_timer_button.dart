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
              builder: (BuildContext context) => _buildPopupDialog(context, 0),
            );
          },
          onPressed: () {
            timerProvider.resetTimer(resetSets: false);
            timerProvider.milliseconds = TimerProvider.convertInMilliseconds(
                quickTimerButtonProvider.quickTimer[0].minutes,
                quickTimerButtonProvider.quickTimer[0].seconds);
          },
          child: Text(
              quickTimerButtonProvider.quickTimer[0].returnFormattedText()),
        ),
        ElevatedButton(
          onLongPress: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog(context, 1),
            );
          },
          onPressed: () {
            timerProvider.resetTimer(resetSets: false);
            timerProvider.milliseconds = TimerProvider.convertInMilliseconds(
                quickTimerButtonProvider.quickTimer[1].minutes,
                quickTimerButtonProvider.quickTimer[1].seconds);
          },
          child: Text(
              quickTimerButtonProvider.quickTimer[1].returnFormattedText()),
        ),
        ElevatedButton(
          onLongPress: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog(context, 2),
            );
          },
          onPressed: () {
            timerProvider.resetTimer(resetSets: false);
            timerProvider.milliseconds = TimerProvider.convertInMilliseconds(
                quickTimerButtonProvider.quickTimer[2].minutes,
                quickTimerButtonProvider.quickTimer[2].seconds);
          },
          child: Text(
              quickTimerButtonProvider.quickTimer[2].returnFormattedText()),
        ),
      ],
    );
  }
}

Widget _buildPopupDialog(BuildContext context, int i) {
  var quickTimerButtonProvider = context.watch<QuickTimerButtonProvider>();
  return AlertDialog(
    title: const Text('Set timer shortcut'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            NumberPicker(
              value: quickTimerButtonProvider.quickTimer[i].minutes,
              minValue: 0,
              maxValue: 60,
              onChanged: (value) =>
                  quickTimerButtonProvider.setMinutes(value, i),
            ),
            const Text(":"),
            NumberPicker(
              value: quickTimerButtonProvider.quickTimer[i].seconds,
              minValue: 0,
              maxValue: 60,
              onChanged: (value) =>
                  quickTimerButtonProvider.setSeconds(value, i),
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
