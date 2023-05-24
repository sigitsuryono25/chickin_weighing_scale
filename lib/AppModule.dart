import 'package:chickin_weighing_scale/services/local/database/config/AppDatabase.dart';
import 'package:chickin_weighing_scale/services/network/ApiService.dart';
import 'package:chickin_weighing_scale/services/network/BaseProvider.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    await Get.putAsync<AppDatabase>(() => AppDatabase.init(), permanent: true);
    await Get.putAsync<SharedPreferences>(() => SharedPreferences.getInstance(),
        permanent: true);
    Get.put(BaseProvider(), permanent: true);
    Get.put(ApiService(Get.find()), permanent: true);
    Get.put(Logger());
  }
}

void setupLocator() {
  locator.registerLazySingleton(() => FlutterBluePlus.instance);
  locator.registerSingleton(() => PackageInfo.fromPlatform());
}
