import 'package:chickin_weighting_scale/app/helper/locator.dart';
import 'package:chickin_weighting_scale/app/network/network.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseController extends GetxController {
  var networkUtil = locator.get<NetworkUtil>();
  var flutterBluetooth = locator.get<FlutterBluePlus>();

  Future<SharedPreferences> sharedPref() async {
    await locator.isReady<SharedPreferences>();
    return locator.get<SharedPreferences>();
  }
}
