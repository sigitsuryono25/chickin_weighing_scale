import 'package:chickin_weighting_scale/app/helper/locator.dart';
import 'package:chickin_weighting_scale/app/network/network.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseController extends GetxController {
  var networkUtil = locator.get<NetworkUtil>();
  var preferences = locator.isReadySync<SharedPreferences>()
      ? locator.get<SharedPreferences>()
      : null;

  Future<SharedPreferences> sharedPref() async {
    await locator.isReady<SharedPreferences>();
    return locator.get<SharedPreferences>();
  }
}
