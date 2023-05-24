import 'package:chickin_weighing_scale/controllers/bluetooth/bluetooth_controller.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

class BluetoothBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FlutterBluePlus.instance);
    Get.lazyPut(() => BluetoothController(Get.find()));
  }
}
