import '../../models/requests/TaskItemReq.dart';
import '../BaseController.dart';

class TaskListController extends BaseController {
  List<TaskItemModel> itemTask = [
    TaskItemModel(
        1000, "ABF 1", DateTime.now().toString(), "Inbound", "Union 1"),
    TaskItemModel(2000, "ABF 2", DateTime.now().toString(), "Inbound", "ABF 3"),
    TaskItemModel(
        3000, "ABF 3", DateTime.now().toString(), "Transfer", "Union"),
    TaskItemModel(4000, "CS 1", DateTime.now().toString(), "Outbound", "ABF 1"),
    TaskItemModel(5000, "Union 1", DateTime.now().toString(), "Inbound", "CS 1")
  ];

  @override
  void onInit() async {
    super.onInit();
    scrollListener();
  }
}
