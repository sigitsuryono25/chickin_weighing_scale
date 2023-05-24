import 'package:chickin_weighing_scale/models/responses/login/ResponseLogin.dart';
import 'package:chickin_weighing_scale/shared/common/Preferences.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

import '../../models/requests/LoginReq.dart';
import '../../providers/AuthProvider.dart';
import '../../shared/constants/Constant.dart';
import '../BaseController.dart';

class LoginController extends BaseController with StateMixin {
  late final AuthProvider _authProvider;

  LoginController(this._authProvider);

  Future<String?> processingLogin(LoginData data) async  {
    var req = LoginRequest(
      params: Params(
          login: "your_email@chickin.id", //
          password: "password", //
          db: "selected_db"),
    );

    var data = await _authProvider.doAuth(req);
    if(data is ResponseLogin) {
      data.result?.username?.writeToPreferences(Constant.USERNAME);
      data.result?.name?.writeToPreferences(Constant.NAME);
      data.result?.sessionId?.writeToPreferences(Constant.SESSION_ID);
    }else{
      return data;
    }
  }
}
