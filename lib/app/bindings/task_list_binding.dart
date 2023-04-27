import 'package:chickin_weighting_scale/app/controller/task_list_controller.dart';
import 'package:get/get.dart';

class TaskListBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TaskListController());
  }

}