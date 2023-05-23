// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AllDao? _allDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `tb_barang_masuk` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `jenis` TEXT, `tanggal_produksi` TEXT, `ekor` TEXT, `bobot` TEXT, `iot` INTEGER, `id_task` INTEGER)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AllDao get allDao {
    return _allDaoInstance ??= _$AllDao(database, changeListener);
  }
}

class _$AllDao extends AllDao {
  _$AllDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _barangMasukEntityInsertionAdapter = InsertionAdapter(
            database,
            'tb_barang_masuk',
            (BarangMasukEntity item) => <String, Object?>{
                  'id': item.id,
                  'jenis': item.jenis,
                  'tanggal_produksi': item.tanggalProduksi,
                  'ekor': item.ekor,
                  'bobot': item.kg,
                  'iot': item.iot,
                  'id_task': item.idTask
                },
            changeListener),
        _barangMasukEntityUpdateAdapter = UpdateAdapter(
            database,
            'tb_barang_masuk',
            ['id'],
            (BarangMasukEntity item) => <String, Object?>{
                  'id': item.id,
                  'jenis': item.jenis,
                  'tanggal_produksi': item.tanggalProduksi,
                  'ekor': item.ekor,
                  'bobot': item.kg,
                  'iot': item.iot,
                  'id_task': item.idTask
                },
            changeListener),
        _barangMasukEntityDeletionAdapter = DeletionAdapter(
            database,
            'tb_barang_masuk',
            ['id'],
            (BarangMasukEntity item) => <String, Object?>{
                  'id': item.id,
                  'jenis': item.jenis,
                  'tanggal_produksi': item.tanggalProduksi,
                  'ekor': item.ekor,
                  'bobot': item.kg,
                  'iot': item.iot,
                  'id_task': item.idTask
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<BarangMasukEntity> _barangMasukEntityInsertionAdapter;

  final UpdateAdapter<BarangMasukEntity> _barangMasukEntityUpdateAdapter;

  final DeletionAdapter<BarangMasukEntity> _barangMasukEntityDeletionAdapter;

  @override
  Stream<List<BarangMasukEntity>> getAllBarangMasuk() {
    return _queryAdapter.queryListStream(
        'SELECT * FROM tb_barang_masuk ORDER BY id DESC',
        mapper: (Map<String, Object?> row) => BarangMasukEntity(
            row['id'] as int?,
            row['jenis'] as String?,
            row['tanggal_produksi'] as String?,
            row['ekor'] as String?,
            row['bobot'] as String?,
            row['iot'] as int?,
            row['id_task'] as int?),
        queryableName: 'tb_barang_masuk',
        isView: false);
  }

  @override
  Stream<List<BarangMasukEntity>> getAllBarangMasukByTaskId(int idTask) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM tb_barang_masuk WHERE id_task = ?1 ORDER BY id DESC',
        mapper: (Map<String, Object?> row) => BarangMasukEntity(
            row['id'] as int?,
            row['jenis'] as String?,
            row['tanggal_produksi'] as String?,
            row['ekor'] as String?,
            row['bobot'] as String?,
            row['iot'] as int?,
            row['id_task'] as int?),
        arguments: [idTask],
        queryableName: 'tb_barang_masuk',
        isView: false);
  }

  @override
  Future<List<BarangMasukEntity>> findBarangById(String id) async {
    return _queryAdapter.queryList('SELECT * FROM tb_barang WHERE id = ?1',
        mapper: (Map<String, Object?> row) => BarangMasukEntity(
            row['id'] as int?,
            row['jenis'] as String?,
            row['tanggal_produksi'] as String?,
            row['ekor'] as String?,
            row['bobot'] as String?,
            row['iot'] as int?,
            row['id_task'] as int?),
        arguments: [id]);
  }

  @override
  Future<BarangMasukEntity?> getLastBarangId() async {
    return _queryAdapter.query(
        'SELECT * FROM tb_barang_masuk ORDER BY id DESC LIMIT 1',
        mapper: (Map<String, Object?> row) => BarangMasukEntity(
            row['id'] as int?,
            row['jenis'] as String?,
            row['tanggal_produksi'] as String?,
            row['ekor'] as String?,
            row['bobot'] as String?,
            row['iot'] as int?,
            row['id_task'] as int?));
  }

  @override
  Future<int?> getCountData() async {
    return _queryAdapter.query('SELECT COUNT(*) FROM tb_barang_masuk LIMIT 1',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<int?> getCountDataByTaskId(int idTask) async {
    return _queryAdapter.query(
        'SELECT COUNT(*) FROM tb_barang_masuk WHERE id_task = ?1 LIMIT 1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [idTask]);
  }

  @override
  Future<int> insertBarangMasuk(BarangMasukEntity barangMasukEntity) {
    return _barangMasukEntityInsertionAdapter.insertAndReturnId(
        barangMasukEntity, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateBarangMasuk(BarangMasukEntity barangMasukEntity) {
    return _barangMasukEntityUpdateAdapter.updateAndReturnChangedRows(
        barangMasukEntity, OnConflictStrategy.replace);
  }

  @override
  Future<int> deleteBarangMasuk(BarangMasukEntity barangMasukEntity) {
    return _barangMasukEntityDeletionAdapter
        .deleteAndReturnChangedRows(barangMasukEntity);
  }
}
