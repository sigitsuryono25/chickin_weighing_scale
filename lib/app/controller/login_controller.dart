import 'package:chickin_weighing_scale/utils/constant.dart';
import 'package:chickin_weighing_scale/utils/helper/environment.dart';
import 'package:flutter_login/flutter_login.dart';

import '../data/source/remote/network/api_req.dart';
import '../data/source/remote/network/model/login/login_request.dart';
import '../data/utils/status.dart';
import 'base_controller.dart';

class LoginController extends BaseController {
  Future<String?> processingLogin(LoginData data) async {
    var req = LoginRequest(
      params: Params(
          login: "dikky@chickin.id", //
          password: "dicky161098@", //
          db: "DEVELOPMENT_UPSTREAM_28_02_23"),
    );

    var result = await ApiRequest.auth(req);
    if (result is Success) {
      sharedPref().then((pref) {
        pref.setString(
            Constant.NAME, "${result.data?.result?.partnerDisplayName}");
        pref.setString(Constant.USERNAME, "${result.data?.result?.username}");
        pref.setString(
            Constant.SESSION_ID, "${result.data?.result?.sessionId}");
      });
      return null;
    } else if (result is Error) {
      return "(${result.errorCode}) ${result.message}";
    } else {
      return null;
    }
  }
}
