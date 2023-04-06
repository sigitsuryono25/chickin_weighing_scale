import 'package:chickin_weighting_scale/app/controller/form_tally_controller.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../controller/task_controller.dart';

DataTable2 tableRingkasan(TaskController controller) {
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
      controller.listBarangMasuk.length,
      (index) => DataRow(
        cells: [
          DataCell(
            Text(controller.listBarangMasuk[index].id.toString()),
          ),
          DataCell(
            Text(controller.listBarangMasuk[index].jenis.toString()),
          ),
          DataCell(
            Text(controller.listBarangMasuk[index].ekor.toString()),
          ),
          DataCell(
            Text(controller.listBarangMasuk[index].kg.toString()),
          ),
        ],
      ),
    ),
  );
}

DataTable2 tableDetail(FormTallyController controller) {
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
      controller.listBarangMasuk.length,
      (index) => DataRow(
        cells: [
          DataCell(
            Text(controller.listBarangMasuk[index].id.toString()),
          ),
          DataCell(
            Text(controller.listBarangMasuk[index].tanggalProduksi.toString()),
          ),
          DataCell(
            Text(controller.listBarangMasuk[index].jenis.toString()),
          ),
          DataCell(
            Text(controller.listBarangMasuk[index].ekor.toString()),
          ),
          DataCell(
            Text(controller.listBarangMasuk[index].kg.toString()),
          ),
        ],
      ),
    ),
  );
}
