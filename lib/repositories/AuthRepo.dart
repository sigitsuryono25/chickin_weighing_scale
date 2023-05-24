import 'package:chickin_weighing_scale/models/requests/LoginReq.dart';
import 'package:chickin_weighing_scale/services/common/CustomHeaders.dart';
import 'package:chickin_weighing_scale/services/network/ApiConstants.dart';
import 'package:chickin_weighing_scale/services/network/ApiService.dart';

class AuthRepo {
  final ApiService _apiService;

  AuthRepo(this._apiService);

  Future<dynamic> doAuth(LoginRequest loginRequest) async {
    var customHeaders = CustomHeaders.setSessionId();
    var response = await _apiService.post(
        endpoint: EndPointConstant.LOGIN_URL,
        body: loginRequest.toJson(),
        headers: customHeaders);
    return response;
  }
}
