import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../utils/constant.dart';
import '../../../../di/app_module.dart';

class NetworkUtil {
  static const BASEURL = "https://dev-odoo.chickinindonesia.com/";
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: BASEURL,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3)
    ),
  )..interceptors.add(Logging());
  static const X_API_KEY = "";

  static Future<Map<String, String>> setSessionId() async {
    await locator.isReady<SharedPreferences>();
    var sharedPref = locator.get<SharedPreferences>();
    var sessionId = sharedPref.get(Constant.SESSION_ID);
    return <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Cookie": "session_id $sessionId",
      "x-api-key": X_API_KEY
    };
  }
}

class Logging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    return super.onError(err, handler);
  }
}
