import 'package:chickin_weighing_scale/AppModule.dart';
import 'package:chickin_weighing_scale/shared/common/Logging.dart';
import 'package:chickin_weighing_scale/shared/common/WorkManagers.dart';
import 'package:chickin_weighing_scale/utils/helper/FileHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:workmanager/workmanager.dart';

import 'routes/Routes.dart';
import 'shared/constants/ColorConstants.dart';
import 'themes/AppThemes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: gray100, // navigation bar color
    statusBarColor: gray100, // status bar color
    statusBarIconBrightness: Brightness.dark, // status bar icon color
    systemNavigationBarIconBrightness:
        Brightness.dark, // color of navigation controls
  ));
  setupLocator();
  setupWorkManager();
  await AppBinding().dependencies();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: gray100,
      debugShowCheckedModeBanner: false,
      title: "Chickin Weighing Scale",
      getPages: AppPages.pages,
      initialRoute: Routes.SPLASH,
      theme: appThemeData,
      defaultTransition: Transition.fade,
    );
  }
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
