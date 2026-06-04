import '../../../core/storage/local_database.dart';
import '../../models/csps_model.dart';
import 'package:sqflite/sqflite.dart';

class CspsLocalSource {
  final LocalDatabase _db;

  CspsLocalSource({required LocalDatabase db}) : _db = db;

  Future<List<CspsModel>> getCsps() async {
    final db = await _db.database;
    final rows = await db.query('csps');
    return rows.map((row) => CspsModel.fromSqlite(row)).toList();
  }

  Future<CspsModel> getCspsById(String id) async {
    final db = await _db.database;
    final rows = await db.query(
      'csps',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) {
      throw Exception('CSPS $id introuvable en cache.');
    }
    return CspsModel.fromSqlite(rows.first);
  }

  Future<void> sauvegarderCsps(List<CspsModel> cspsList) async {
    final db = await _db.database;
    final batch = db.batch();
    for (final csps in cspsList) {
      batch.insert(
        'csps',
        csps.toSqlite(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }
}
