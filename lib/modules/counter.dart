import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CounterController extends GetxController {
  // Constructor
  CounterController({
    this.name = 'Counter',
    this.priority = 10,
    this.incrementBy = 1,
  });

  String name = '';
  int priority = 10;
  int incrementBy = 1;
  var count = 0.obs;

  void increment() {
    count.value += incrementBy;
    Box box = Hive.box('counters');
    box.put(name, toJson());
  }

  void decrement() {
    count.value -= incrementBy;
    Box box = Hive.box('counters');
    box.put(name, toJson());
  }

  void setCount(int value) => count.value = value;
  void clear() {
    count.value = 0;
    Box box = Hive.box('counters');
    box.put(name, toJson());
  }

  void rename(String newName) => name = newName;
  void changePriority(int newPriority) => priority = newPriority;

  Map toJson() => {
        'name': name,
        'priority': priority,
        'incrementBy': incrementBy,
        'count': count.value,
      };

  factory CounterController.fromJson(Map<String, dynamic> json) =>
      CounterController(
        name: json['name'],
        priority: json['priority'],
        incrementBy: json['incrementBy'],
      );
}
