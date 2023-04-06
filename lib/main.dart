import 'package:chickin_weighting_scale/app/theme/app_color.dart';
import 'package:chickin_weighting_scale/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'app/routes/app_pages.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: global_palette_gray_100, // navigation bar color
    statusBarColor: global_palette_gray_100, // status bar color
    statusBarIconBrightness: Brightness.dark, // status bar icon color
    systemNavigationBarIconBrightness: Brightness.dark, // color of navigation controls
  ));
  runApp(GetMaterialApp(
    color: global_palette_gray_100,
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.INITIAL,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    theme: appThemeData,
  ));
}
