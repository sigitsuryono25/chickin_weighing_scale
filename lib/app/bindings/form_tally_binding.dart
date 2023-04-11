import 'package:chickin_weighting_scale/app/controller/form_tally_controller.dart';
import 'package:get/get.dart';

class FormTallyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FormTallyController());
  }
}
