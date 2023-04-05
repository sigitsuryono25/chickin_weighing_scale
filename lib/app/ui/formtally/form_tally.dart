import 'package:chickin_weighting_scale/app/controller/form_tally_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../partial/app_bar.dart';

class FormTallyPage extends GetView<FormTallyController> {
  final controller = Get.put(FormTallyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(title: "Form Tally", subtitle: "", context: context),
      body: Column(),
    );
  }
}
