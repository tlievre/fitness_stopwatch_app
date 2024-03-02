import 'package:fitness_stopwatch_app/pages/timer_page.dart';
import 'package:fitness_stopwatch_app/pages/parameter_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    void handleClick(int item) {
      if (item == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ParameterPage()),
        );
      }
    }

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Fitness App'),
          // bottom: const TabBar(
          //   tabs: <Widget>[
          //     Tab(
          //       icon: Icon(Icons.timer),
          //     ),
          //     Tab(
          //       icon: Icon(Icons.settings),
          //     ),
          //   ],
          // ),
          actions: <Widget>[
            PopupMenuButton<int>(
              onSelected: (item) => handleClick(item),
              itemBuilder: (context) => <PopupMenuEntry<int>>[
                const PopupMenuItem<int>(
                  value: 1,
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                  ),
                )
              ],
            )
          ],
        ),
        body: const TimerPage(),
        // body: const TabBarView(
        //   children: <Widget>[
        //     TimerPage(),
        //     ParameterPage(),
        //   ],
        // ),
      ),
    );
  }
}
