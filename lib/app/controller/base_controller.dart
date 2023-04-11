import 'package:chickin_weighting_scale/app/database/config/app_database.dart';
import 'package:chickin_weighting_scale/app/locator/locator.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

abstract class BaseController extends GetxController {

  Future<AppDatabase> dbIsReady() async {
    await locator.isReady<AppDatabase>();
    return locator.get<AppDatabase>();
  }
}
