import 'package:get/get.dart';

import '../../utils/constant.dart';
import '../routes/app_pages.dart';
import 'base_controller.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 5)).then((value) {
      sharedPref().then((value) {
        if (value.containsKey(Constant.USERNAME)) {
          Get.offAndToNamed(Routes.TASK_LIST);
        } else {
          Get.offAndToNamed(Routes.LOGIN);
        }
      });
    });
  }
}
