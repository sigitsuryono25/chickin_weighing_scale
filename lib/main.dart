import 'package:chickin_weighing_scale/app/di/app_module.dart';
import 'package:chickin_weighing_scale/utils/helper/file_helper.dart';
import 'package:chickin_weighing_scale/utils/helper/logging.dart';
import 'package:chickin_weighing_scale/utils/helper/workmanager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:workmanager/workmanager.dart';

import 'app/routes/app_pages.dart';
import 'app/ui/theme/app_color.dart';
import 'app/ui/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: global_palette_gray_100, // navigation bar color
    statusBarColor: global_palette_gray_100, // status bar color
    statusBarIconBrightness: Brightness.dark, // status bar icon color
    systemNavigationBarIconBrightness:
        Brightness.dark, // color of navigation controls
  ));
  setupLocator();
  setupWorkManager();
  runApp(GetMaterialApp(
    color: global_palette_gray_100,
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.SPLASH,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    theme: appThemeData,
  ));
}

@pragma('vm:entry-point')
void callbackDispatcher() async {
  Workmanager().executeTask((taskName, inputData) {
    FileHelper().writeToLog("${DateTime.now()}\t\t\t\t $taskName");
    loggingError(message: taskName);
    return Future.value(true);
  });
}

void setupWorkManager() {
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  WorkManagerHelper.registerPeriodicTaskDemo();
}
