import 'package:chickin_weighting_scale/app/database/config/app_database.dart';
import 'package:chickin_weighting_scale/app/network/network.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingletonAsync(() => AppDatabase.init());
  locator.registerSingleton(NetworkUtil());
  locator.registerSingletonAsync(() => SharedPreferences.getInstance());
  locator.registerFactory(() => Logger());
  locator.registerLazySingleton(() => FlutterBluePlus.instance);
}
