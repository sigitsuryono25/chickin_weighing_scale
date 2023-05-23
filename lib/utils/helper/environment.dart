import 'package:chickin_weighing_scale/utils/helper/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';

enum EnvType { staging, prod }

class Environment {
  static Future<EnvType> getEnv() async {
    PackageInfo packInfo = await PackageInfo.fromPlatform();
    loggingError(message: packInfo.packageName);
    switch (packInfo.packageName) {
      case "com.chickinapps.weighing.scale.staging":
        return EnvType.staging;
      default:
        return EnvType.prod;
    }
  }
}
