import 'package:sqflite/sqflite.dart';
import '../../../core/storage/local_database.dart';
import '../../models/visite_model.dart';

class VisiteLocalSource {
  final LocalDatabase _db;

  VisiteLocalSource({required LocalDatabase db}) : _db = db;

  Future<void> sauvegarderVisite(VisiteModel visite) async {
    final db = await _db.database;
    await db.insert(
      'visites',
      visite.toSqlite(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<VisiteModel>> getVisitesPending() async {
    final db = await _db.database;
    final rows = await db.query(
      'visites',
      where: 'sync_status = ?',
      whereArgs: ['pending'],
    );
    return rows.map((row) => VisiteModel.fromSqlite(row)).toList();
  }

  Future<List<VisiteModel>> getVisitesParAgent(String agentId) async {
    final db = await _db.database;
    final rows = await db.query(
      'visites',
      where: 'agent_id = ?',
      whereArgs: [agentId],
      orderBy: 'date DESC',
    );
    return rows.map((row) => VisiteModel.fromSqlite(row)).toList();
  }

  Future<void> marquerCommeSynced(String id) async {
    final db = await _db.database;
    await db.update(
      'visites',
      {'sync_status': 'synced'},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> marquerCommeEchec(String id) async {
    final db = await _db.database;
    await db.update(
      'visites',
      {'sync_status': 'failed'},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
