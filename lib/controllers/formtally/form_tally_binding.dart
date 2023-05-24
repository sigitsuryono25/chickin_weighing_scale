import 'package:get/get.dart';

import 'form_tally_controller.dart';

class FormTallyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FormTallyController(Get.find(), Get.find()));
  }
}
