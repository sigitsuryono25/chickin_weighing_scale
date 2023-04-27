import 'dart:convert';

import 'package:chickin_weighting_scale/app/controller/task_list_controller.dart';
import 'package:chickin_weighting_scale/app/routes/app_pages.dart';
import 'package:chickin_weighting_scale/app/ui/partial/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_color.dart';

class TaskListPage extends GetView<TaskListController> {
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
                        Text("${controller.itemTask[index].from} \u2794 ${controller.itemTask[index].taskName}"),
                        Text(controller.itemTask[index].type.toString()),
                      ],
                    ),
                    subtitle: Text(controller.itemTask[index].date.toString()),
                    onTap: () {
                      Get.toNamed(Routes.INITIAL,
                          arguments: jsonEncode(controller.itemTask[index].toJson()));
                    },
                  );
                });
          }),
        ),
      ),
    );
  }
}
