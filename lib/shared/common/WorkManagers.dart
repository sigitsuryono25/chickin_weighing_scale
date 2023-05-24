import 'package:workmanager/workmanager.dart';

class WorkManagerHelper {
  static registerOneTaskDemo() {
    Workmanager().registerOneOffTask("oneofftask", "simpleTask");
  }

  static registerPeriodicTaskDemo() {
    Workmanager().registerPeriodicTask('periodic task', "repeatable task",
        frequency: const Duration(minutes: 15));
  }
}
