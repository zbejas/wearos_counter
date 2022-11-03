import 'package:get/get.dart';
import 'package:wearos_counter/modules/counter.dart';

class CounterManager extends GetxController {
  List<CounterController> counters = <CounterController>[].obs;

  void remove(CounterController counter) => counters.remove(counter);
  void sortByPriority() =>
      counters.sort((CounterController a, CounterController b) =>
          a.priority.compareTo(b.priority));
}
