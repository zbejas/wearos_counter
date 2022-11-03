import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:wearos_counter/modules/manager.dart';

import '../modules/counter.dart';

class CounterCreator extends StatelessWidget {
  const CounterCreator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController priorityController = TextEditingController();
    final TextEditingController incrementController = TextEditingController();

    final CounterManager manager = Get.find();

    Box box = Hive.box('counters');

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Create a new counter',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Name (default: Counter)',
                  hintStyle: TextStyle(fontSize: 12),
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: priorityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Priority (default: 10)',
                  hintStyle: TextStyle(fontSize: 12),
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: incrementController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Increment (default: 1)',
                  hintStyle: TextStyle(fontSize: 12),
                ),
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  var newCounter = CounterController(
                    name: nameController.text == ''
                        ? 'Counter'
                        : nameController.text,
                    priority: int.tryParse(priorityController.text) ?? 10,
                    incrementBy: int.tryParse(incrementController.text) ?? 1,
                  );

                  if (box.containsKey(newCounter.name)) {
                    Get.snackbar(
                      'Error',
                      'A counter with that name already exists\n   ',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                    return;
                  }

                  box.put(newCounter.name, newCounter.toJson());

                  manager.counters.add(newCounter);
                  Get.back();
                },
                child: const Text('Create'),
              ),
              TextButton(
                onPressed: () => Get.back(),
                child: const Text('Go back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
