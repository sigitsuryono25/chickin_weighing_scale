import 'package:chickin_weighing_scale/app/ui/theme/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../controller/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<SplashController>(
        builder: (controller) {
          return Container(
            color: global_palette_cblue_500,
            child: Image.asset('assets/ic_logo_chickin_white.png'),
          );
        },
      ),
    );
  }
}
