import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';
import '../data/source/local/database/config/app_database.dart';
import '../data/source/local/database/model/barang_masuk.dart';
import '../data/source/remote/network/model/task_item_model.dart';
import '../di/app_module.dart';
import 'base_controller.dart';

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
    if(itemModel != null){
      return db.allDao.getAllBarangMasukByTaskId(itemModel!.id);
    }else{
     return const Stream.empty();
    }
  }

  @override
  void onInit() {
    super.onInit();
    itemModel = TaskItemModel.fromJson(jsonDecode(Get.arguments));
  }
}
