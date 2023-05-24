import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/Routes.dart';
import '../../shared/constants/Constant.dart';
import '../BaseController.dart';

class SplashController extends BaseController {
  late final SharedPreferences _preferences;

  SplashController(this._preferences);

  @override
  void onReady() {
    super.onReady();
    Get.find<SharedPreferences>();
    Future.delayed(const Duration(seconds: 5)).then((value) {
      if (_preferences.containsKey(Constant.USERNAME)) {
        Get.offAndToNamed(Routes.TASK_LIST);
      } else {
        Get.offAndToNamed(Routes.LOGIN);
      }
    });
  }
}
