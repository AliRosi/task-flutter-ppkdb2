import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tugas1_flutter/study_case/model/siswa_model.dart';

class DbHelperSiswa {
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'siswa.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE siswa(id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, umur INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertSiswa(Siswa siswa) async {
    final db = await DbHelperSiswa.db();
    await db.insert(
      'siswa',
      siswa.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Siswa>> getAllSiswa() async {
    final db = await DbHelperSiswa.db();
    final List<Map<String, dynamic>> maps = await db.query('siswa');

    return List.generate(maps.length, (i) => Siswa.fromMap(maps[i]));
  }
}
