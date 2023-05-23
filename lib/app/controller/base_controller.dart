import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/source/remote/network/network.dart';
import '../di/app_module.dart';

abstract class BaseController extends GetxController {
  var networkUtil = locator.get<NetworkUtil>();
  var flutterBluetooth = locator.get<FlutterBluePlus>();
  late StreamSubscription<ConnectivityResult> connectivityResult;

  Future<SharedPreferences> sharedPref() async {
    await locator.isReady<SharedPreferences>();
    return locator.get<SharedPreferences>();
  }

  @override
  void onInit() {
    super.onInit();
    connectivityResult = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult event) async {
      if (event != ConnectivityResult.none) {
        var hasInternetAccess = await InternetConnectionChecker().hasConnection;
        if (!hasInternetAccess) {
          Get.snackbar("Informasi", "Internet Terputus",
              icon:
                  const Icon(Icons.warning_rounded, color: Colors.orangeAccent));
        }
      } else {
        Get.snackbar("Informasi", "Internet Terputus",
            icon: const Icon(
              Icons.warning_rounded,
              color: Colors.orangeAccent,
            ));
      }
    });
  }

  @override
  void dispose() {
    connectivityResult.cancel();
    super.dispose();
  }
}
