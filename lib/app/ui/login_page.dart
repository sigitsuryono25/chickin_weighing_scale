import 'package:chickin_weighing_scale/app/ui/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';
import '../routes/app_pages.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<LoginController>(
        builder: (controller) {
          return FlutterLogin(
            logo: const AssetImage('assets/ic_logo_chickin_white.png'),
            title: "Weighing Scale",
            theme: LoginTheme(
              cardTheme: const CardTheme(elevation: 4.0, color: Colors.white),
              primaryColor: global_palette_cblue_500,
              buttonTheme: const LoginButtonTheme(
                backgroundColor: global_palette_cblue_600,
              ),
              titleStyle: const TextStyle(
                  fontSize: 22.0,
                  fontFamily: "Nunito",
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            onLogin: controller.processingLogin,
            messages:
                LoginMessages(userHint: "Username", passwordHint: "Password"),
            onRecoverPassword: (value) {},
            userValidator: (value) {
              if (value?.isEmpty == true) {
                return "Username harus diisi";
              } else {
                return null;
              }
            },
            onSubmitAnimationCompleted: () {
              Get.offAndToNamed(Routes.TASK_LIST);
            },
            passwordValidator: (value) {
              if (value != null) {
                if (value.isEmpty) {
                  return "Password harus diisi";
                } else if (value.length < 8) {
                  return "Password minimal 8 karakter";
                } else {
                  return null;
                }
              }
            },
            userType: LoginUserType.name,
            hideProvidersTitle: true,
            hideForgotPasswordButton: true,
          );
        },
      ),
    );
  }
}
