import '../../../core/storage/local_database.dart';
import '../../models/methode_model.dart';
import 'package:sqflite/sqflite.dart';

class MethodeLocalSource {
  final LocalDatabase _db;

  MethodeLocalSource({required LocalDatabase db}) : _db = db;

  Future<List<MethodeModel>> getMethodes() async {
    final db = await _db.database;
    final rows = await db.query('methodes');
    return rows.map((row) => MethodeModel.fromSqlite(row)).toList();
  }

  Future<MethodeModel> getMethodeById(String id) async {
    final db = await _db.database;
    final rows = await db.query(
      'methodes',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) {
      throw Exception('Méthode $id introuvable en cache.');
    }
    return MethodeModel.fromSqlite(rows.first);
  }

  Future<void> sauvegarderMethodes(List<MethodeModel> methodes) async {
    final db = await _db.database;
    final batch = db.batch();
    for (final methode in methodes) {
      batch.insert(
        'methodes',
        methode.toSqlite(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }
}
