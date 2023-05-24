import 'dart:convert';

import 'package:chickin_weighing_scale/shared/common/Logging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/entity/BarangMasukEntity.dart';
import '../../models/requests/TaskItemReq.dart';
import '../../services/local/database/config/AppDatabase.dart';
import '../../shared/utils.dart';
import '../../AppModule.dart';
import '../BaseController.dart';

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
  var icons = Icons.sync.obs;
  var iconColors = Colors.black54.obs;
  late AppDatabase db;

  TaskController(this.db);

  Future<Stream<List<BarangMasukEntity>>> getAllDataBarang() async {
    if (itemModel != null) {
      return db.allDao.getAllBarangMasukByTaskId(itemModel!.id);
    } else {
      return const Stream.empty();
    }
  }

  @override
  void onInit() {
    super.onInit();
    itemModel = TaskItemModel.fromJson(jsonDecode(Get.arguments));
    scrollListener();
    loggingError(message: "$isVisible");
    Future.delayed(const Duration(seconds: 3), () {
      icons.value = Icons.check_circle_rounded;
      iconColors.value = Colors.green;
    });
  }
}
