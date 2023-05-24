import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../../shared/common/DialogHelper.dart';
import '../BaseController.dart';

class BluetoothController extends BaseController {
  late FlutterBluePlus flutterBluetooth;
  var pd = ProgressDialog(context: Get.context);
  Future<Map<Permission, PermissionStatus>> nearby = [
    Permission.location,
    Permission.bluetoothScan,
    Permission.bluetoothConnect,
  ].request();
  List<ScanResult> listResult = List.empty(growable: true);

  BluetoothController(this.flutterBluetooth);

  checkPermission() async {
    var x = await nearby;
    for (PermissionStatus s in x.values) {
      if (s.isDenied) {
        Get.defaultDialog(
          title: "Peringatan",
          content: Text("Permission denied for ${x.keys}"),
          confirm: ElevatedButton(
            onPressed: () async {
              await flutterBluetooth.turnOn();
              flutterBluetooth.state.listen((BluetoothState event) {
                if (event == BluetoothState.on) {
                  // startScan();
                } else {
                  AppSettings.openBluetoothSettings();
                }
              });
            },
            child: const Text("Open App Info"),
          ),
        );
        break;
      }
    }
    var bluetoothScan = Permission.bluetoothConnect.request();
    if (await bluetoothScan.isGranted) {
      if (!await flutterBluetooth.isOn) {
        DialogHelper.defaultDialogConfirmCancel(
            title: "Konfirmasi",
            content: "Nyalakan Bluetotooth",
            rightActionText: "Nyalakan",
            rightAction: () async {
              AppSettings.openBluetoothSettings();
            },
            leftAction: () {},
            leftActionText: "Batalkan");
      }
    } else {
      checkPermission();
    }
  }

  startScan() {
    checkPermission();
    flutterBluetooth.startScan(
        scanMode: ScanMode.balanced, timeout: const Duration(seconds: 5));
    flutterBluetooth.scanResults.listen((event) {
      listResult = event;
    });
  }

  connectToDevice(BluetoothDevice device) async {
    device.connect(timeout: const Duration(seconds: 15));
    pd.show(msg: "Menyambungkan...", backgroundColor: Colors.white);
    Future.delayed(const Duration(seconds: 15)).then((value) => pd.close());
  }
}
