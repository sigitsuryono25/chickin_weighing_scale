import 'dart:convert';
import 'dart:io';

import 'package:chickin_weighing_scale/app/data/source/remote/network/response/login/Response_login.dart';
import 'package:chickin_weighing_scale/utils/helper/logging.dart';
import 'package:dio/dio.dart';

import '../../../utils/status.dart';
import 'end_point_constant.dart';
import 'model/login/login_request.dart';
import 'package:http/http.dart' as http;

import 'network.dart';

class ApiRequest {

  static Future<Status<ResponseLogin>> auth(LoginRequest loginRequest) async {
    try {
      var sessionid = await NetworkUtil.setSessionId();
      var dio = NetworkUtil.dio;
      dio.options.headers = sessionid;
      var request = await dio.post(
          EndPointConstant.LOGIN_URL,
          data: loginRequest.toJson()
      );
      var response = ResponseLogin.fromJson(request.data);
      if (response.error != null) {
        return Error(
            message: "${response.error?.message}",
            errorData: "${response.error?.data?.message}");
      }
      return Success(response);
    } on DioError catch(e){
      return Error(
        message: "${e.response?.statusMessage}",
        errorData: "${e.response?.data}",
        errorCode: e.response?.statusCode
      );
    }
  }

  static Future<Status<http.Response>> getTaskTimbangById(String idTask) async {
    var _sessionid = await NetworkUtil.setSessionId();
    var request = await http.post(
        Uri.parse("${EndPointConstant.GET_TASK_TIMBANG_BY_ID}/$idTask"),
        headers: _sessionid);
    try {
      if (request.statusCode != 200) {
        throw HttpException(request.statusCode.toString());
      }
      return Success(request);
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