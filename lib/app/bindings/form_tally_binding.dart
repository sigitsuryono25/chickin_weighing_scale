import 'package:get/get.dart';

import '../controller/form_tally_controller.dart';

class FormTallyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FormTallyController());
  }
}
