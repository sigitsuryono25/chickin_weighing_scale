import 'package:chickin_weighting_scale/app/bindings/form_tally_binding.dart';
import 'package:chickin_weighting_scale/app/bindings/task_binding.dart';
import 'package:chickin_weighting_scale/app/ui/formtally/form_tally_page.dart';
import 'package:chickin_weighting_scale/app/ui/task/task_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => TaskTimbangPage(),
        binding: TaskBinding()),
    GetPage(
        name: Routes.FORM_TALLY,
        page: () => FormTallyPage(),
        binding: FormTallyBinding())
  ];
}
