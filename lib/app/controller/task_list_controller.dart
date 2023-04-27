import 'package:chickin_weighting_scale/app/controller/base_controller.dart';
import 'package:chickin_weighting_scale/app/network/model/task_item_model.dart';

class TaskListController extends BaseController{
  List<TaskItemModel> itemTask = [
    TaskItemModel("ABF 1", DateTime.now().toString(), "Inbound", "Union 1"),
    TaskItemModel("ABF 2", DateTime.now().toString(), "Inbound", "ABF 3"),
    TaskItemModel("ABF 3", DateTime.now().toString(), "Transfer", "Union"),
    TaskItemModel("CS 1", DateTime.now().toString(), "Outbound", "ABF 1"),
    TaskItemModel("Union 1", DateTime.now().toString(), "Inbound", "CS 1")
  ];
}