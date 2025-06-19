import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tugas1_flutter/tugas11_flutter/model/lokasi_model.dart';

class DbHelperLokasi {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, 'lokasi_favorit.db');

    return openDatabase(dbPath, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE lokasi (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT NOT NULL,
        latitude REAL NOT NULL,
        longitude REAL NOT NULL
      )
    ''');
  }

  Future<int> insertLokasi(LokasiModel lokasi) async {
    final db = await database;
    return await db.insert('lokasi', lokasi.toMap());
  }

  Future<List<LokasiModel>> getAllLokasi() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('lokasi');

    return List.generate(maps.length, (i) => LokasiModel.fromMap(maps[i]));
  }

  Future<int> updateLokasi(LokasiModel lokasi) async {
    final db = await database;
    return await db.update(
      'lokasi',
      lokasi.toMap(),
      where: 'id = ?',
      whereArgs: [lokasi.id],
    );
  }

  Future<int> deleteLokasi(int id) async {
    final db = await database;
    return await db.delete('lokasi', where: 'id = ?', whereArgs: [id]);
  }
}
