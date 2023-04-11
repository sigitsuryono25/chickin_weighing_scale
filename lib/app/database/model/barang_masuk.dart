import 'dart:convert';

import 'package:floor/floor.dart';

@Entity(tableName: "tb_barang_masuk")
class BarangMasukEntity {
  @PrimaryKey(autoGenerate: true)
  int? id;

  @ColumnInfo(name: "jenis")
  String? jenis;

  @ColumnInfo(name: "tanggal_produksi")
  String? tanggalProduksi;

  @ColumnInfo(name: "ekor")
  String? ekor;

  @ColumnInfo(name: "bobot")
  String? kg;

  @ColumnInfo(name: "iot")
  int? iot;

  BarangMasukEntity(
      this.id, this.jenis, this.tanggalProduksi, this.ekor, this.kg, this.iot);

  BarangMasukEntity.noId(
      {this.jenis, this.tanggalProduksi, this.ekor, this.kg, this.iot});

  Map<String, dynamic> toJson() {
    var mapping = <String, dynamic>{
      'id': id,
      'jenis': jenis,
      'tanggal_produksi': tanggalProduksi,
      'ekor': ekor,
      'bobot': kg,
      'iot': iot
    };
    print(jsonEncode(mapping));
    return mapping;
  }
}
