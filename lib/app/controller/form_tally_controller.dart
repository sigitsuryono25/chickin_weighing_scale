import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../utils/constant.dart';
import '../../utils/utils.dart';
import '../data/barang_masuk.dart';
import '../data/source/local/database/config/app_database.dart';
import '../data/source/local/database/model/barang_masuk.dart';
import '../data/source/remote/network/model/task_item_model.dart';
import '../di/app_module.dart';
import 'base_controller.dart';

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
    if(itemModel != null) {
      return db.allDao.getAllBarangMasukByTaskId(itemModel!.id.toInt());
    }else{
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
    barangMasuk.iot = booleanToInt(on.value);
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
    await locator.isReady<AppDatabase>();
    var db = locator.get<AppDatabase>();
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
    if(itemModel != null) {
      var lastNumber = await db.allDao.getCountDataByTaskId(itemModel!.id);
      if (lastNumber != null) {
        noController.text = (lastNumber + 1).toString();
      }
    }else{
      noController.text = 1.toString();
    }
  }

  _addData(BarangMasuk barangMasuk) async {
    await locator.isReady<AppDatabase>();
    AppDatabase db = locator.get<AppDatabase>();
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
    sharedPref().then((value) =>
        on.value = value.getBool(Constant.IS_AUTO_VALUE_BOBOT) ?? false);
    itemModel = TaskItemModel.fromJson(jsonDecode(Get.arguments));
    to = itemModel?.taskName;
    from = itemModel?.from;
  }
}
