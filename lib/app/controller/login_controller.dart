import 'package:chickin_weighing_scale/utils/constant.dart';
import 'package:flutter_login/flutter_login.dart';

import '../data/source/remote/network/api_req.dart';
import '../data/source/remote/network/model/login/login_request.dart';
import '../data/utils/status.dart';
import 'base_controller.dart';

class LoginController extends BaseController {
  Future<String?> processingLogin(LoginData data) async {
    var req = LoginRequest(
      params: Params(
          login: data.name, // "dikky@chickin.id"
          password: data.password, //"dicky161098@"
          db: "DEVELOPMENT_UPSTREAM_28_02_23"),
    );

    var result = await ApiRequest.auth(req);
    if (result is Success) {
      sharedPref().then((pref) {
        pref.setString(
            Constant.NAME, "${result.data?.result?.partnerDisplayName}");
        pref.setString(Constant.USERNAME, "${result.data?.result?.username}");
      });
      return null;
    } else if (result is Error) {
      return "${result.errorData}";
    } else {
      return null;
    }
  }
}
