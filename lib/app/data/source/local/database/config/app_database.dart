import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../../../../utils/constant.dart';
import '../dao/all_dao.dart';
import '../model/barang_masuk.dart';

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
