import 'package:app_settings/app_settings.dart';
import 'package:chickin_weighting_scale/app/controller/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class BluetoothController extends BaseController {
  var pd = ProgressDialog(context: Get.context);

  @override
  void onInit() {
    super.onInit();
    checkPermission();
  }

  checkPermission() async {
    Map<Permission, PermissionStatus> nearby =
        await [Permission.location, Permission.bluetoothScan].request();
    for (PermissionStatus s in nearby.values) {
      if (s.isDenied) {
        Get.defaultDialog(
          title: "Peringatan",
          content: Text("Permission denied for ${nearby.keys}"),
          confirm: ElevatedButton(
            onPressed: () {
              AppSettings.openAppSettings();
            },
            child: const Text("Open App Info"),
          ),
        );
        break;
      }
    }
    await flutterBluetooth.turnOn();
  }

  Stream<List<ScanResult>> startScan() {
    flutterBluetooth.startScan(
        scanMode: ScanMode.balanced, timeout: const Duration(seconds: 5));
    return flutterBluetooth.scanResults;
  }

  connectToDevice(BluetoothDevice device) async {
    device.connect(timeout: const Duration(seconds: 15));
    pd.show(msg: "Menyambungkan...", backgroundColor: Colors.white);
    Future.delayed(const Duration(seconds: 15)).then((value) => pd.close());
  }
}
