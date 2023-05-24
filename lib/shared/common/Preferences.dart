import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension WriteToPreferences on String {
  void writeToPreferences(String key) {
    var prefs = Get.find<SharedPreferences>();
    prefs.setString(key, this);
  }
}
