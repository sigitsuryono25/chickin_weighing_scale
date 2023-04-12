import 'package:chickin_weighting_scale/app/controller/base_controller.dart';
import 'package:chickin_weighting_scale/app/routes/app_pages.dart';
import 'package:chickin_weighting_scale/utils/constant.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 5)).then((value) {
      sharedPref().then((value) {
        if (value.containsKey(Constant.USERNAME)) {
          Get.offAndToNamed(Routes.INITIAL);
        } else {
          Get.offAndToNamed(Routes.LOGIN);
        }
      });
    });
  }
}
