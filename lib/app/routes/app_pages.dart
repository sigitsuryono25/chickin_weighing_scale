import 'package:get/get.dart';

import '../bindings/bluetooth_binding.dart';
import '../bindings/form_tally_binding.dart';
import '../bindings/login_binding.dart';
import '../bindings/splash_binding.dart';
import '../bindings/task_binding.dart';
import '../bindings/task_list_binding.dart';
import '../ui/bluetooth_page.dart';
import '../ui/form_tally_page.dart';
import '../ui/login_page.dart';
import '../ui/splash_page.dart';
import '../ui/task_list_page.dart';
import '../ui/task_page.dart';

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
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: Transition.rightToLeftWithFade,
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
    ),
    GetPage(
      name: Routes.TASK_LIST,
      page: () => TaskListPage(),
      binding: TaskListBinding(),
    )
  ];
}
