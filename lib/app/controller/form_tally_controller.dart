import 'package:chickin_weighting_scale/app/data/barang_masuk.dart';
import 'package:chickin_weighting_scale/app/database/config/app_database.dart';
import 'package:chickin_weighting_scale/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../database/model/barang_masuk.dart';
import '../locator/locator.dart';

class FormTallyController extends GetxController {
  List<BarangMasuk> listBarangMasuk = List<BarangMasuk>.empty(growable: true);
  final noController = TextEditingController();
  final ekorController = TextEditingController();
  final bobotController = TextEditingController();
  final tanggalProduksiController =
      TextEditingController(text: getCurrentDateTime(format: "dd/MM/yyyy"));
  String? selectedJenis = "";
  final List<String> items = [
    'Karkas Frozen 1.1-1.2kg',
    'Karkas Frozen 1.3-1.4kg',
    'Karkas Frozen 1.5-1.6kg',
    'Karkas Frozen 1.7-1.8kg',
    'Karkas Frozen 1.9-2.0kg',
    'Karkas Frozen 2.1-2.2kg',
    'Karkas Frozen 2.3-2.4kg',
  ];

  Future<Stream<List<BarangMasukEntity>>> getSavedData() async {
    await locator.isReady<AppDatabase>();
    var db = locator.get<AppDatabase>();
    _setLastNumber(db);
    return db.allDao.getAllBarangMasuk();
  }

  populateInput() {
    var barangMasuk = BarangMasuk();
    barangMasuk.id = int.tryParse(noController.text);
    barangMasuk.ekor = ekorController.text;
    barangMasuk.iot = 1;
    barangMasuk.jenis = selectedJenis;
    barangMasuk.kg = bobotController.text;
    barangMasuk.tanggalProduksi = tanggalProduksiController.text;

    _addData(barangMasuk);
  }

  _setLastNumber(AppDatabase db) async {
    var lastNumber = await db.allDao.getCountData();
    if(lastNumber != null){
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
    if (insert > 0) {
      Get.snackbar("", "Insert Data berhasil");
      _resetInput();
      getSavedData();
    }
  }

  _resetInput() {
    ekorController.text = "";
    selectedJenis = "";
    bobotController.text = "";
    tanggalProduksiController.text = getCurrentDateTime(format: "dd/MM/yyyy");
  }
}
