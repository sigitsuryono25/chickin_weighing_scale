import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../controller/task_controller.dart';

DataTable2 tableRingkasan(TaskController _) {
  return DataTable2(
    columnSpacing: 12,
    horizontalMargin: 12,
    minWidth: 600,
    columns: const [
      DataColumn2(
        label: Text('No'),
        size: ColumnSize.S,
      ),
      DataColumn(label: Text('Jenis')),
      DataColumn2(label: Text('Ekor'), size: ColumnSize.L),
      DataColumn2(label: Text('Kg'), size: ColumnSize.L),
    ],
    rows: List<DataRow>.generate(
      _.listBarangMasuk.length,
      (index) => DataRow(
        cells: [
          DataCell(
            Text(_.listBarangMasuk[index].id.toString()),
          ),
          DataCell(
            Text(_.listBarangMasuk[index].jenis.toString()),
          ),
          DataCell(
            Text(_.listBarangMasuk[index].ekor.toString()),
          ),
          DataCell(
            Text(_.listBarangMasuk[index].kg.toString()),
          ),
        ],
      ),
    ),
  );
}
