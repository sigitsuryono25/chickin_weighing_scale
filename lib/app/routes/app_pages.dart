import 'package:chickin_weighting_scale/app/bindings/bluetooth_binding.dart';
import 'package:chickin_weighting_scale/app/bindings/form_tally_binding.dart';
import 'package:chickin_weighting_scale/app/bindings/login_binding.dart';
import 'package:chickin_weighting_scale/app/bindings/splash_binding.dart';
import 'package:chickin_weighting_scale/app/bindings/task_binding.dart';
import 'package:chickin_weighting_scale/app/ui/bluetooth_page.dart';
import 'package:chickin_weighting_scale/app/ui/form_tally_page.dart';
import 'package:chickin_weighting_scale/app/ui/login_page.dart';
import 'package:chickin_weighting_scale/app/ui/splash_page.dart';
import 'package:chickin_weighting_scale/app/ui/task_page.dart';
import 'package:get/get.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => TaskTimbangPage(),
      binding: TaskBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.FORM_TALLY,
      page: () => FormTallyPage(),
      binding: FormTallyBinding(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.BLUETOOTH,
      page: () => BluetoothPage(),
      binding: BluetoothBinding(),
    )
  ];
}
