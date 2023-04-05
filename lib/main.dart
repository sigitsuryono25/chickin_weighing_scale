import 'package:chickin_weighting_scale/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(GetMaterialApp(

    debugShowCheckedModeBanner: false,
    initialRoute: Routes.INITIAL,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    theme: appThemeData,
  ));
}
