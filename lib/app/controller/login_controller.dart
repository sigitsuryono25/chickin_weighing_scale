import 'package:chickin_weighting_scale/app/controller/base_controller.dart';
import 'package:chickin_weighting_scale/utils/constant.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginController extends BaseController {
  Future<String?> loginProsess(LoginData data) {
    return Future.delayed(const Duration(seconds: 5)).then((value) {
      if (data.name == "adminchickin" && data.password == "chickin123") {
        sharedPref().then((value) {
          value.setString(Constant.USERNAME, data.name);
          value.setString(Constant.NAME, "Sigit Suryono");
        });
        return null;
      } else {
        return "Username or password not found !";
      }
    });
  }
}
