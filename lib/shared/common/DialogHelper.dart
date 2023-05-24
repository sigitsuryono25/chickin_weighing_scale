import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../constants/ColorConstants.dart';

class DialogHelper {
  static defaultDialogSingleAction(
      {required String title, required String content, required String actionText, VoidCallback? action}) {
    if (Get.isDialogOpen == true) {
      Get.close(0);
    }
    Get.defaultDialog(
      title: title,
      content: Text(content),
      confirm: TextButton(
        onPressed: () => action?.call(),
        child: Text(actionText),
      ),
    );
  }

  static defaultDialogConfirmCancel({
    required String title,
    required String content,
    String rightActionText = "Oke",
    Function? rightAction,
    bool changeRedRightButton = false,
    String leftActionText = "Batal",
    Function? leftAction,
    bool changeRedLeftButton = false,
  }) {
    Get.defaultDialog(
      title: title,
      content: Text(content),
      confirm: TextButton(
        child: Text(
          rightActionText,
          style: TextStyle(
              color:
                  changeRedRightButton ? Colors.red : cBlue500),
        ),
        onPressed: () {
          rightAction?.call();
          Get.close(0);
        },
      ),
      cancel: TextButton(
        child: Text(
          leftActionText,
          style: TextStyle(
              color:
                  changeRedLeftButton ? Colors.red : cBlue500),
        ),
        onPressed: () {
          leftAction?.call();
          Get.close(0);
        },
      ),
    );
  }
}
