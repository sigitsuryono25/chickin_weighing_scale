import 'dart:convert';

import 'package:chickin_weighting_scale/app/controller/base_controller.dart';
import 'package:chickin_weighting_scale/app/data/barang_masuk.dart';
import 'package:chickin_weighting_scale/app/database/config/app_database.dart';
import 'package:chickin_weighting_scale/app/network/model/task_item_model.dart';
import 'package:chickin_weighting_scale/utils/constant.dart';
import 'package:chickin_weighting_scale/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../database/model/barang_masuk.dart';
import '../helper/locator.dart';

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

  String? from, to;
  void toggle() => on.value = on.value ? false : true;

  Future<Stream<List<BarangMasukEntity>>> getSavedData() async {
    await locator.isReady<AppDatabase>();
    var db = locator.get<AppDatabase>();
    _setLastNumber(db);
    return db.allDao.getAllBarangMasuk();
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
    barangMasuk.iot = booleanToInt(on.value);
    barangMasuk.jenis = selectedJenis.value.toString();
    barangMasuk.kg = bobotController.text;
    barangMasuk.tanggalProduksi = tanggalProduksiController.text;

    if (!isEdit.value) {
      _addData(barangMasuk);
    } else {
      _editData(barangMasuk);
    }
  }

  _editData(BarangMasuk barangMasuk) async {
    await locator.isReady<AppDatabase>();
    var db = locator.get<AppDatabase>();
    var barangEntity = BarangMasukEntity(
        barangMasuk.id,
        barangMasuk.jenis,
        barangMasuk.tanggalProduksi,
        barangMasuk.ekor,
        barangMasuk.kg,
        barangMasuk.iot);
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
    await locator.isReady<AppDatabase>();
    var db = locator.get<AppDatabase>();
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
    var lastNumber = await db.allDao.getCountData();
    if (lastNumber != null) {
      noController.text = (lastNumber + 1).toString();
    }
  }

  _addData(BarangMasuk barangMasuk) async {
    await locator.isReady<AppDatabase>();
    AppDatabase db = locator.get<AppDatabase>();
    var barangEntity = BarangMasukEntity(
        barangMasuk.id,
        barangMasuk.jenis,
        barangMasuk.tanggalProduksi,
        barangMasuk.ekor,
        barangMasuk.kg,
        barangMasuk.iot);
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
    sharedPref().then((value) =>
        on.value = value.getBool(Constant.IS_AUTO_VALUE_BOBOT) ?? false);
    itemModel = TaskItemModel.fromJson(jsonDecode(Get.arguments));
    to = itemModel?.taskName;
    from = itemModel?.from;
  }
}
