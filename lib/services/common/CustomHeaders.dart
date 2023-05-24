import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/constants/Constant.dart';

class CustomHeaders {
  static Map<String, String> setSessionId() {
    var prefs = Get.find<SharedPreferences>();
    var sessionId = prefs.get(Constant.SESSION_ID);
    return <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Cookie": "session_id $sessionId",
      "x-api-key": ""
    };
  }
}
