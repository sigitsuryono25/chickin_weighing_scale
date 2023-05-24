import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../../../../shared/constants/Constant.dart';
import '../dao/AllDao.dart';
import '../../../../../models/entity/BarangMasukEntity.dart';

part 'AppDatabase.g.dart';

@Database(version: 1, entities: [BarangMasukEntity])
abstract class AppDatabase extends FloorDatabase {
  AllDao get allDao;

  static Future<AppDatabase> init() async {
    AppDatabase instance =
        await $FloorAppDatabase.databaseBuilder(Constant.DB_NAME).build();
    return instance;
  }
}
