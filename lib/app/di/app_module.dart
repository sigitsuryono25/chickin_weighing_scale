import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/source/local/database/config/app_database.dart';
import '../data/source/remote/network/network.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingletonAsync(() => AppDatabase.init());
  locator.registerSingleton(NetworkUtil());
  locator.registerSingletonAsync(() => SharedPreferences.getInstance());
  locator.registerFactory(() => Logger());
  locator.registerLazySingleton(() => FlutterBluePlus.instance);
  locator.registerSingleton(()=> PackageInfo.fromPlatform());
}
