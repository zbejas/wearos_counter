import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:wearos_counter/pages/info.dart';

import '../../pages/counter_creator.dart';
import '../counter.dart';
import '../manager.dart';

class ActiveScreen extends StatelessWidget {
  const ActiveScreen({
    Key? key,
    required this.manager,
    required this.box,
  }) : super(key: key);

  final CounterManager manager;
  final Box box;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (manager.counters.isNotEmpty) ...[
                      // Sort icon button
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.sort),
                              onPressed: () {
                                manager.sortByPriority();
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.info_outline),
                              onPressed: () {
                                Get.to(const InfoPage());
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 0),
                    ],
                    ...manager.counters
                        .map(
                          (CounterController counter) => Obx(
                            () => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  counter.name,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      tooltip: 'Decrement',
                                      icon: const Icon(Icons.remove),
                                      onPressed: counter.decrement,
                                    ),
                                    GestureDetector(
                                      onLongPress: () {
                                        box.delete(counter.name);
                                        manager.remove(counter);
                                      },
                                      onDoubleTap: () => counter.clear(),
                                      child: Text(counter.count.toString(),
                                          style: const TextStyle(fontSize: 24)),
                                    ),
                                    IconButton(
                                      tooltip: 'Increment',
                                      icon: const Icon(Icons.add),
                                      onPressed: counter.increment,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ]),
            ),
            // Add a new counter button
            IconButton(
              icon: const Icon(Icons.add),
              tooltip: 'Add a new counter',
              onPressed: () {
                // go to the counter creator page
                Get.to(() => const CounterCreator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
