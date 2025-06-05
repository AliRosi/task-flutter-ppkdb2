import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tugas1_flutter/tugas11_flutter/model/lokasi_model.dart';

class DbHelperLokasi {
  static final DbHelperLokasi _instance = DbHelperLokasi._internal();
  factory DbHelperLokasi() => _instance;
  DbHelperLokasi._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'lokasi.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE lokasi(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT,
        latitude REAL,
        longitude REAL
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
    return maps.map((e) => LokasiModel.fromMap(e)).toList();
  }
}
