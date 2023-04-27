import 'dart:convert';

import 'package:chickin_weighting_scale/app/controller/base_controller.dart';
import 'package:chickin_weighting_scale/app/database/config/app_database.dart';
import 'package:chickin_weighting_scale/app/database/model/barang_masuk.dart';
import 'package:chickin_weighting_scale/app/network/model/task_item_model.dart';
import 'package:chickin_weighting_scale/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/locator.dart';

class TaskController extends BaseController {
  final TextEditingController waktuTimbang =
      TextEditingController(text: getCurrentDateTime());
  final TextEditingController waktuTimbangSelesai =
      TextEditingController(text: getCurrentDateTime());

  final TextEditingController waktuKedatanganKendaraan =
      TextEditingController(text: "2/16/2023 10:56:44");
  final TextEditingController suhu = TextEditingController(text: "-1");
  final TextEditingController noSegel = TextEditingController(text: "206");
  TaskItemModel? itemModel;

  Future<Stream<List<BarangMasukEntity>>> getAllDataBarang() async {
    await locator.isReady<AppDatabase>();
    AppDatabase db = locator.get<AppDatabase>();
    return db.allDao.getAllBarangMasuk();
  }

  @override
  void onInit() {
    super.onInit();
    itemModel = TaskItemModel.fromJson(jsonDecode(Get.arguments));
  }
}
