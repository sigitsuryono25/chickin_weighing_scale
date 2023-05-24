class ApiConstants{
  static const baseUrl = "https://dev-odoo.chickinindonesia.com/";
}

class EndPointConstant {
  static String BASE_API = "api";
  static String BASE_WEIGHING_SCALE = "$BASE_API/chickin_weighing_scale";
  static String LOGIN_URL = "web/session/authenticate";
  static String GET_TASK_TIMBANG_BY_ID =
      "$BASE_WEIGHING_SCALE/weight_task";

  static String GET_TASK_TIMBANG =
      "$BASE_WEIGHING_SCALE/weight_task";
}
