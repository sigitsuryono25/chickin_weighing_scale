import 'dart:async';

import 'package:chickin_weighting_scale/app/database/dao/all_dao.dart';
import 'package:chickin_weighting_scale/app/database/model/barang_masuk.dart';
import 'package:chickin_weighting_scale/utils/constant.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [BarangMasukEntity])
abstract class AppDatabase extends FloorDatabase {
  AllDao get allDao;

  static Future<AppDatabase> init() async {
    AppDatabase instance =
        await $FloorAppDatabase.databaseBuilder(Constant.DB_NAME).build();
    return instance;
  }
}
