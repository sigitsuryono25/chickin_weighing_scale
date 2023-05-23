import 'dart:async';
import 'package:chickin_weighing_scale/utils/helper/environment.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../di/app_module.dart';

abstract class BaseController extends GetxController {
  var flutterBluetooth = locator.get<FlutterBluePlus>();
  late StreamSubscription<ConnectivityResult> connectivityResult;

  Future<SharedPreferences> sharedPref() async {
    await locator.isReady<SharedPreferences>();
    return locator.get<SharedPreferences>();
  }

  RxBool isVisible = true.obs;
  late ScrollController hideButtonController;

  void scrollListener() {
    hideButtonController = ScrollController();
    hideButtonController.addListener((){
      if(hideButtonController.position.userScrollDirection == ScrollDirection.reverse){
        if(isVisible.value == true) {
          /* only set when the previous state is false
             * Less widget rebuilds
             */
          print("**** ${isVisible.value} up"); //Move IO away from setState
          isVisible.value = false;
        }
      } else {
        if(hideButtonController.position.userScrollDirection == ScrollDirection.forward){
          if(isVisible.value == false) {
            /* only set when the previous state is false
               * Less widget rebuilds
               */
            print("**** ${isVisible.value} down"); //Move IO away from setState
            isVisible.value = true;
          }
        }
      }});
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
