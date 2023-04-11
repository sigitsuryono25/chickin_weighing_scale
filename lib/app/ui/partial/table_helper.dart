import 'package:chickin_weighting_scale/app/controller/form_tally_controller.dart';
import 'package:chickin_weighting_scale/app/database/model/barang_masuk.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

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
            Text(barang[index].id.toString()),
          ),
          DataCell(
            Text(barang[index].jenis.toString()),
          ),
          DataCell(
            Text(barang[index].ekor.toString()),
          ),
          DataCell(
            Text(barang[index].kg.toString()),
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
              Text(barang[index].ekor.toString()),
            ),
            DataCell(
              Text(barang[index].kg.toString()),
            ),
          ],
        );
      },
    ),
  );
}
