import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../pages/counter_creator.dart';
import '../counter.dart';
import '../manager.dart';

class AmbientScreen extends StatelessWidget {
  const AmbientScreen({
    Key? key,
    required this.manager,
  }) : super(key: key);

  final CounterManager manager;

  @override
  Widget build(BuildContext context) {
    manager.sortByPriority();

    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // todo: display all counters in the list in a 2x2 grid
              Obx(
                () => GridView.count(
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children: [
                    ...manager.counters.take(4).toList().map(
                          (CounterController counter) => Obx(() => Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    counter.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    counter.count.toString(),
                                    style: const TextStyle(
                                      fontSize: 24,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
