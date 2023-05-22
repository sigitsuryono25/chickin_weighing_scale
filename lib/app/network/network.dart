import 'dart:io';

import 'package:chickin_weighting_scale/app/helper/locator.dart';
import 'package:chickin_weighting_scale/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkUtil {
  static const BASEURL = "https://dev-odoo.chickinindonesia.com/";

  static Future<Map<String, String>> setSessionId() async {
    await locator.isReady<SharedPreferences>();
    var sharedPref = locator.get<SharedPreferences>();
    var sessionId = sharedPref.get(Constant.SESSION_ID);
    return <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Cookie": "session_id $sessionId"
    };
  }
}
