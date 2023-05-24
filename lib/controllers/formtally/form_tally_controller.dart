import 'dart:convert';
import 'dart:math';

import 'package:chickin_weighing_scale/shared/helpers/AnyExtestion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/entity/BarangMasukEntity.dart';
import '../../models/requests/BarangMasukReq.dart';
import '../../models/requests/TaskItemReq.dart';
import '../../services/local/database/config/AppDatabase.dart';
import '../../shared/constants/Constant.dart';
import '../../shared/utils.dart';
import '../BaseController.dart';

class FormTallyController extends BaseController {
  List<BarangMasuk> listBarangMasuk = List<BarangMasuk>.empty(growable: true);
  final noController = TextEditingController();
  final ekorController = TextEditingController();
  final bobotController = TextEditingController();
  final tanggalProduksiController =
      TextEditingController(text: getCurrentDateTime(format: "dd/MM/yyyy"));
  final List<String> items = [
    'Karkas Frozen 1.1-1.2kg',
    'Karkas Frozen 1.3-1.4kg',
    'Karkas Frozen 1.5-1.6kg',
    'Karkas Frozen 1.7-1.8kg',
    'Karkas Frozen 1.9-2.0kg',
    'Karkas Frozen 2.1-2.2kg',
    'Karkas Frozen 2.3-2.4kg',
  ];
  RxString selectedJenis = RxString("");
  RxBool on = false.obs;
  bool hasData = false;
  RxBool isEdit = RxBool(false);
  RxBool isBobotEmpty = RxBool(false);
  RxBool isEkorEmpty = RxBool(false);
  TaskItemModel? itemModel;
  var icons = Icons.sync.obs;
  var iconColors = Colors.black54.obs;
  String? from, to;
  late final SharedPreferences preferences;
  late AppDatabase db;

  FormTallyController(this.db, this.preferences);

  void toggle() => on.value = on.value ? false : true;

  Future<Stream<List<BarangMasukEntity>>> getSavedData() async {
    _setLastNumber(db);
    if (itemModel != null) {
      return db.allDao.getAllBarangMasukByTaskId(itemModel!.id.toInt());
    } else {
      return const Stream.empty();
    }
  }

  populateInput() {
    if (ekorController.text.isEmpty) {
      isEkorEmpty.value = true;
      return;
    } else {
      isEkorEmpty.value = false;
    }
    if (bobotController.text.isEmpty) {
      isBobotEmpty.value = true;
      return;
    } else {
      isBobotEmpty.value = false;
    }
    isEkorEmpty.value = false;
    isBobotEmpty.value = false;

    if (selectedJenis.value.isEmpty) {
      selectedJenis.value = items.first;
    }
    var barangMasuk = BarangMasuk();
    barangMasuk.id = int.tryParse(noController.text);
    barangMasuk.ekor = ekorController.text;
    barangMasuk.iot = on.value.booleanToInt();
    barangMasuk.jenis = selectedJenis.value.toString();
    barangMasuk.kg = bobotController.text;
    barangMasuk.tanggalProduksi = tanggalProduksiController.text;
    barangMasuk.idTask = itemModel?.id;

    if (!isEdit.value) {
      _addData(barangMasuk);
    } else {
      _editData(barangMasuk);
    }
  }

  _editData(BarangMasuk barangMasuk) async {
    var barangEntity = BarangMasukEntity(
        barangMasuk.id,
        barangMasuk.jenis,
        barangMasuk.tanggalProduksi,
        barangMasuk.ekor,
        barangMasuk.kg,
        barangMasuk.iot,
        barangMasuk.idTask);
    var updateData = await db.allDao.updateBarangMasuk(barangEntity);
    if (updateData > 0) {
      Get.snackbar("Info", "Data berhasil diubah");
      _resetInput();
      getSavedData();
      isEdit.value = false;
    } else {
      Get.snackbar("Kesalahan", "Data gagal diubah");
    }
  }

  deleteData(BarangMasukEntity barangMasukEntity) async {
    var delete = await db.allDao.deleteBarangMasuk(barangMasukEntity);
    if (delete > 0) {
      Get.snackbar("Info", "Data berhasil dihapus");
      _resetInput();
      getSavedData();
    } else {
      Get.snackbar("Kesalahan", "Data gagal dihapus");
    }
  }

  _setLastNumber(AppDatabase db) async {
    if (itemModel != null) {
      var lastNumber = await db.allDao.getCountDataByTaskId(itemModel!.id);
      if (lastNumber != null) {
        noController.text = (lastNumber + 1).toString();
      }
    } else {
      noController.text = 1.toString();
    }
  }

  _addData(BarangMasuk barangMasuk) async {
    var barangEntity = BarangMasukEntity(
        Random().nextInt(1000),
        barangMasuk.jenis,
        barangMasuk.tanggalProduksi,
        barangMasuk.ekor,
        barangMasuk.kg,
        barangMasuk.iot,
        barangMasuk.idTask);
    var insert = await db.allDao.insertBarangMasuk(barangEntity);
    // var insertToOdoo = await networkUtil.sendDataIntoOdoo(barangEntity);
    if (insert > 0) {
      Get.snackbar("Info", "Data berhasil ditambahkan");
      _resetInput();
      getSavedData();
    } else {
      Get.snackbar("Kesalahan", "Data gagal ditambahkan");
    }
  }

  _resetInput() {
    ekorController.text = "";
    bobotController.text = "";
    tanggalProduksiController.text = getCurrentDateTime(format: "dd/MM/yyyy");
  }

  @override
  void onInit() {
    super.onInit();
    on.value = preferences.getBool(Constant.IS_AUTO_VALUE_BOBOT) ?? false;
    itemModel = TaskItemModel.fromJson(jsonDecode(Get.arguments));
    to = itemModel?.taskName;
    from = itemModel?.from;
    Future.delayed(const Duration(seconds: 3), () {
      icons.value = Icons.check_circle_rounded;
      iconColors.value = Colors.green;
    });
  }
}
