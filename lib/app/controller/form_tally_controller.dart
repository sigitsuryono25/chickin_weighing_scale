import 'package:chickin_weighting_scale/app/data/barang_masuk.dart';
import 'package:chickin_weighting_scale/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FormTallyController extends GetxController {
  List<BarangMasuk> listBarangMasuk = List<BarangMasuk>.empty(growable: true);
  final noController = TextEditingController(text: "1");
  final ekorController = TextEditingController();
  final bobotController = TextEditingController();
  final tanggalProduksiController = TextEditingController(text: getCurrentDateTime(format: "dd/MM/yyyy"));
  var selectedJenis = "";

  initDummyData() {
    var b1 = BarangMasuk(
        id: 1,
        jenis: "Karkas Frozen 1.2-1.4kg",
        tanggalProduksi: "2/16/2023",
        ekor: "50",
        kg: "100",
        iot: 0);
    var b2 = BarangMasuk(
        id: 2,
        jenis: "Karkas Frozen 1.2-1.4kg",
        tanggalProduksi: "2/16/2023",
        ekor: "50",
        kg: "100",
        iot: 0);
    var b3 = BarangMasuk(
        id: 3,
        jenis: "Karkas Frozen 1.2-1.4kg",
        tanggalProduksi: "2/16/2023",
        ekor: "50",
        kg: "100",
        iot: 0);
    var b4 = BarangMasuk(
        id: 4,
        jenis: "Karkas Frozen 1.2-1.4kg",
        tanggalProduksi: "2/16/2023",
        ekor: "50",
        kg: "100",
        iot: 0);
    var b5 = BarangMasuk(
        id: 5,
        jenis: "Karkas Frozen 1.2-1.4kg",
        tanggalProduksi: "2/16/2023",
        ekor: "50",
        kg: "100",
        iot: 0);

    listBarangMasuk.add(b1);
    listBarangMasuk.add(b2);
    listBarangMasuk.add(b3);
    listBarangMasuk.add(b4);
    listBarangMasuk.add(b5);
  }
}
