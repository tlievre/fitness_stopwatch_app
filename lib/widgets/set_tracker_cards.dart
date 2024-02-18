import 'package:fitness_stopwatch_app/providers/timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
