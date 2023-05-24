import 'package:get/get.dart';

import '../controllers/bluetooth/bluetooth_binding.dart';
import '../controllers/formtally/form_tally_binding.dart';
import '../controllers/login/login_binding.dart';
import '../controllers/splash/splash_binding.dart';
import '../controllers/task/task_binding.dart';
import '../controllers/tasklist/task_list_binding.dart';
import '../views/bluetooth_page.dart';
import '../views/form_tally_page.dart';
import '../views/login_page.dart';
import '../views/splash_page.dart';
import '../views/task_list_page.dart';
import '../views/task_page.dart';

part 'RoutesName.dart';

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
