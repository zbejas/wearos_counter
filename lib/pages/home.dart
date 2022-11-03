import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:wear/wear.dart';
import 'package:wearos_counter/modules/counter.dart';
import 'package:wearos_counter/modules/manager.dart';
import 'package:wearos_counter/modules/widgets/ambient_screen.dart';

import '../modules/widgets/active_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CounterManager manager = Get.put(CounterManager());

    Box box = Hive.box('counters');

    initCounters(box, manager);

    manager.sortByPriority();

    return Scaffold(
      backgroundColor: Colors.black,
      body: AmbientMode(
        builder: (context, mode, child) {
          return mode == WearMode.ambient
              ? AmbientScreen(
                  manager: manager,
                )
              : ActiveScreen(
                  manager: manager,
                  box: box,
                );
        },
      ),
    );
  }

  void initCounters(Box box, CounterManager manager) {
    for (var counter in box.values) {
      Map<String, dynamic> counterMap = Map<String, dynamic>.from(counter);
      CounterController newCounter = CounterController.fromJson(counterMap);

      manager.counters.add(newCounter);

      // set count on counter
      manager.counters.last.setCount(counterMap['count']);
    }
  }
}
