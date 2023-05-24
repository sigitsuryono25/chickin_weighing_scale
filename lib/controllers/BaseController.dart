import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class BaseController extends GetxController {
  late StreamSubscription<ConnectivityResult> connectivityResult;
  RxBool isVisible = true.obs;
  late ScrollController hideButtonController;

  void scrollListener() {
    hideButtonController = ScrollController();
    hideButtonController.addListener(() {
      if (hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isVisible.value == true) {
          print("**** ${isVisible.value} up"); //Move IO away from setState
          isVisible.value = false;
        }
      } else {
        if (hideButtonController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (isVisible.value == false) {
            print("**** ${isVisible.value} down"); //Move IO away from setState
            isVisible.value = true;
          }
        }
      }
    });
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
              icon: const Icon(Icons.warning_rounded,
                  color: Colors.orangeAccent));
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
