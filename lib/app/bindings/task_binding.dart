import 'package:chickin_weighting_scale/app/controller/task_controller.dart';
import 'package:chickin_weighting_scale/app/database/config/app_database.dart';
import 'package:get/get.dart';

class TaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskController>(() => TaskController());
    // Get.putAsync<AppDatabase>(() async => AppDatabase.init());
  }
}
