import 'package:chickin_weighing_scale/shared/helpers/AnyExtestion.dart';
import 'package:chickin_weighing_scale/shared/helpers/StringExtensions.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../controllers/formtally/form_tally_controller.dart';
import '../../../shared/common/DialogHelper.dart';
import '../../models/entity/BarangMasukEntity.dart';

DataTable2 tableRingkasan(List<BarangMasukEntity> barang) {
  return DataTable2(
    columnSpacing: 12,
    horizontalMargin: 12,
    minWidth: 600,
    columns: const [
      DataColumn2(
        label: Text('No'),
        size: ColumnSize.S,
      ),
      DataColumn2(label: Text('Jenis'), fixedWidth: 260.0),
      DataColumn2(label: Text('Ekor'), size: ColumnSize.L),
      DataColumn2(label: Text('Kg'), size: ColumnSize.L),
    ],
    rows: List<DataRow>.generate(
      barang.length,
      (index) => DataRow(
        cells: [
          DataCell(
            Text((index + 1).toString()),
          ),
          DataCell(
            Text(barang[index].jenis.toString()),
          ),
          DataCell(
            Text(barang[index].ekor.toString().moneyFormat()),
          ),
          DataCell(
            Text(barang[index].kg.toString().moneyFormat()),
          ),
        ],
      ),
    ),
  );
}

DataTable2 tableDetail(
    List<BarangMasukEntity> barang, FormTallyController tallyController) {
  return DataTable2(
    columnSpacing: 12,
    horizontalMargin: 12,
    minWidth: 600,
    columns: const [
      DataColumn2(
        label: Text('No'),
        size: ColumnSize.L,
      ),
      DataColumn2(label: Text('Tanggal Produksi'), fixedWidth: 160.0),
      DataColumn2(label: Text('Jenis'), fixedWidth: 260.0),
      DataColumn2(label: Text('Ekor'), size: ColumnSize.L),
      DataColumn2(label: Text('Kg'), size: ColumnSize.L),
    ],
    rows: List<DataRow>.generate(
      barang.length,
      (index) {
        return DataRow(
            cells: [
              DataCell(
                Text((index + 1).toString()),
              ),
              DataCell(
                Text(barang[index].tanggalProduksi.toString()),
              ),
              DataCell(
                Text(barang[index].jenis.toString()),
              ),
              DataCell(
                Text(barang[index].ekor.toString().moneyFormat()),
              ),
              DataCell(
                Text(barang[index].kg.toString().moneyFormat()),
              ),
            ],
            onLongPress: () {
              DialogHelper.defaultDialogConfirmCancel(
                  title: "Konfirmasi",
                  content: "Apa yang akan dilakukan?",
                  rightActionText: "Edit Data",
                  rightAction: () {
                    setFormEdit(tallyController, barang, index);
                  },
                  leftActionText: "Hapus Data",
                  changeRedLeftButton: true,
                  leftAction: () {
                    tallyController.deleteData(barang[index]);
                  });
            });
      },
    ),
  );
}

setFormEdit(FormTallyController tallyController, List<BarangMasukEntity> barang,
    int index) {
  tallyController.isEdit.value = true;
  tallyController.bobotController.text = barang[index].kg.toString();
  tallyController.noController.text = (index + 1).toString();
  tallyController.ekorController.text = barang[index].ekor.toString();
  tallyController.tanggalProduksiController.text =
      barang[index].tanggalProduksi.toString();
  tallyController.selectedJenis.value = barang[index].jenis.toString();
  tallyController.on.value = barang[index].iot.intToBoolean();
}
