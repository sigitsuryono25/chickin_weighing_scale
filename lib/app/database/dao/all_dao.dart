import 'package:chickin_weighting_scale/app/database/model/barang_masuk.dart';
import 'package:floor/floor.dart';

@dao
abstract class AllDao {
  @Query("SELECT * FROM tb_barang_masuk ORDER BY id DESC")
  Stream<List<BarangMasukEntity>> getAllBarangMasuk();

  @Query("SELECT * FROM tb_barang WHERE id = :id")
  Future<List<BarangMasukEntity>> findBarangById(String id);

  @Query("SELECT * FROM tb_barang_masuk ORDER BY id DESC LIMIT 1")
  Future<BarangMasukEntity?> getLastBarangId();

  @Query("SELECT COUNT(*) FROM tb_barang_masuk LIMIT 1")
  Future<int?> getCountData();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertBarangMasuk(BarangMasukEntity barangMasukEntity);

  @delete
  Future<int> deleteBarangMasuk(BarangMasukEntity barangMasukEntity);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<int> updateBarangMasuk(BarangMasukEntity barangMasukEntity);
}
