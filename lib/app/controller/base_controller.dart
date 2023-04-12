import 'package:chickin_weighting_scale/app/locator/locator.dart';
import 'package:chickin_weighting_scale/app/network/network.dart';
import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  var networkUtil = locator.get<NetworkUtil>();
}
