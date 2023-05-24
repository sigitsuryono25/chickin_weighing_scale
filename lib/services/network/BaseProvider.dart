import 'package:chickin_weighing_scale/services/interceptors/RequestInterceptor.dart';
import 'package:chickin_weighing_scale/services/interceptors/ResponseInterceptor.dart';
import 'package:chickin_weighing_scale/services/network/ApiConstants.dart';
import 'package:get/get.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ApiConstants.baseUrl;
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
  }
}
