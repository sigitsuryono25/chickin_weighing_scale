import 'dart:convert';
import 'package:chickin_weighing_scale/app/ui/partial/app_bar.dart';
import 'package:chickin_weighing_scale/app/ui/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';

import '../controller/task_list_controller.dart';
import '../routes/app_pages.dart';

class TaskListPage extends GetView<TaskListController> {
  final globalKeyFab = GlobalKey<ExpandableFabState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(title: "Task List", subtitle: null, context: context),
        body: Container(
          color: mobile_chickin_layer_0,
          child: GetBuilder<TaskListController>(builder: (controller) {
            return ListView.builder(
                itemCount: controller.itemTask.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "${controller.itemTask[index].from} \u2794 ${controller.itemTask[index].taskName}"),
                        Text(controller.itemTask[index].type.toString()),
                      ],
                    ),
                    subtitle: Text(controller.itemTask[index].date.toString()),
                    onTap: () {
                      Get.toNamed(Routes.INITIAL,
                          arguments:
                              jsonEncode(controller.itemTask[index].toJson()));
                    },
                  );
                });
          }),
        ),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: ExpandableFab(
          child: const Icon(Icons.add),
          key: globalKeyFab,
          type: ExpandableFabType.up,
          overlayStyle: ExpandableFabOverlayStyle(
              color: global_palette_gray_700.withOpacity(0.5)),
          children: [
            FloatingActionButton.extended(
              heroTag: "search",
              onPressed: () {},
              label: const Text("Search"),
              icon: const Icon(Icons.search),
            ),
            FloatingActionButton.extended(
              heroTag: "sort",
              onPressed: () {
              },
              tooltip: "Sort data by something",
              label: const Text("Sort"),
              icon: const Icon(Icons.sort),
            ),
          ],
        ),
      ),
    );
  }
}
