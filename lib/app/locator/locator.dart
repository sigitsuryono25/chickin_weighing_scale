import 'package:chickin_weighting_scale/app/database/config/app_database.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerSingletonAsync(() => AppDatabase.init());
}