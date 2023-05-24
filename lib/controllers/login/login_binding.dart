import 'package:chickin_weighing_scale/providers/AuthProvider.dart';
import 'package:chickin_weighing_scale/repositories/AuthRepo.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(Get.find()));
    Get.lazyPut(() => AuthProvider(Get.find()));
    Get.lazyPut(() => AuthRepo(Get.find()));
  }
}
