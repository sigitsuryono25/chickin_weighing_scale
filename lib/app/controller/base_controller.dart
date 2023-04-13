import 'dart:async';

import 'package:chickin_weighting_scale/app/helper/locator.dart';
import 'package:chickin_weighting_scale/app/network/network.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseController extends GetxController {
  var networkUtil = locator.get<NetworkUtil>();
  var preferences = locator.isReadySync<SharedPreferences>()
      ? locator.get<SharedPreferences>()
      : null;
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
      print(event);
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
