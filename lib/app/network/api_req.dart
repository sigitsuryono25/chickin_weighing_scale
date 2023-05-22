import 'dart:convert';
import 'dart:io';

import 'package:chickin_weighting_scale/app/network/network.dart';
import 'package:chickin_weighting_scale/app/network/response/login/Response_login.dart';

import '../data/utils/status.dart';
import 'end_point_constant.dart';
import 'model/login/login_request.dart';
import 'package:http/http.dart' as http;

class ApiRequest{

  static Future<Status<ResponseLogin>> auth(LoginRequest loginRequest) async {
    var _sessionid = await NetworkUtil.setSessionId();
    var request = await http.post(Uri.parse(EndPointConstant.LOGIN_URL),
        headers: _sessionid, body: jsonEncode(loginRequest.toJson()));
    try {
      var response = ResponseLogin.fromJson(jsonDecode(request.body));
      if (request.statusCode != 200) {
        throw HttpException(request.statusCode.toString());
      }
      if (response.error != null) {
        return Error(
            message: "${response.error?.message}",
            errorData: "${response.error?.data?.message}");
      }
      return Success(response);
    } on HttpException catch (e) {
      return Error(
          errorData: e.message,
          errorCode: request.statusCode,
          message: e.message);
    } on SocketException catch (e) {
      return Error(
          errorData: e.message,
          errorCode: request.statusCode,
          message: e.message);
    } on Exception catch (e) {
      return Error(
          errorData: "General Error",
          errorCode: request.statusCode,
          message: "General Error");
    }
  }

  static Future<http.Response> getListTaskTimbang() async {
    var _sessionId = await NetworkUtil.setSessionId();
    var request = await http.post(Uri.parse(EndPointConstant.LOGIN_URL),
        headers: _sessionId);
    return request;
  }
}