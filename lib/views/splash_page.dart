import 'package:chickin_weighing_scale/shared/constants/ColorConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../controllers/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<SplashController>(
        builder: (controller) {
          return Container(
            color: cBlue500,
            child: Image.asset('assets/ic_logo_chickin_white.png'),
          );
        },
      ),
    );
  }
}
