import 'package:chickin_weighting_scale/app/controller/base_controller.dart';
import 'package:chickin_weighting_scale/app/data/utils/status.dart';
import 'package:chickin_weighting_scale/app/network/api_req.dart';
import 'package:chickin_weighting_scale/app/network/model/login/login_request.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginController extends BaseController {
  Future<String?> processingLogin(LoginData data) async {
    var req = LoginRequest(
      params: Params(
          login: "dikky@chickin.id",
          password: "dicky161098@",
          db: "DEVELOPMENT_UPSTREAM_28_02_23"),
    );

    var result = await ApiRequest.auth(req);
    if (result is Success) {
      print(result.data?.jsonrpc);
      return null;
    } else if (result is Error) {
      return "${result.errorData}";
    } else {
      return null;
    }
  }
}
