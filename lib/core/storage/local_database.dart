import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static Database? _db;
  static const int _version = 1;
  static const String _nom = 'sira.db';

  Future<Database> get database async {
    _db ??= await _initialiser();
    return _db!;
  }

  Future<Database> _initialiser() async {
    final chemin = join(await getDatabasesPath(), _nom);
    return await openDatabase(
      chemin,
      version: _version,
      onCreate: _creerTables,
      onUpgrade: _migrerTables,
    );
  }

  Future<void> _creerTables(Database db, int version) async {
    await db.execute('''
      CREATE TABLE methodes (
        id TEXT PRIMARY KEY,
        nom TEXT NOT NULL,
        categorie TEXT NOT NULL,
        efficacite REAL NOT NULL,
        duree TEXT NOT NULL,
        necessite_visite INTEGER NOT NULL,
        est_hormonale INTEGER NOT NULL,
        est_disponible_csps INTEGER NOT NULL,
        description TEXT NOT NULL,
        avantages TEXT NOT NULL,
        inconvenients TEXT NOT NULL,
        effets_secondaires TEXT NOT NULL,
        image_asset TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE csps (
        id TEXT PRIMARY KEY,
        nom TEXT NOT NULL,
        district TEXT NOT NULL,
        latitude REAL NOT NULL,
        longitude REAL NOT NULL,
        telephone TEXT NOT NULL,
        heures_ouverture TEXT NOT NULL,
        est_operationnel INTEGER NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE stocks_csps (
        id TEXT PRIMARY KEY,
        csps_id TEXT NOT NULL,
        methode_id TEXT NOT NULL,
        methode_nom TEXT NOT NULL,
        quantite_disponible INTEGER NOT NULL,
        seuil_alerte INTEGER NOT NULL,
        derniere_mise_a_jour TEXT NOT NULL,
        niveau TEXT NOT NULL,
        FOREIGN KEY (csps_id) REFERENCES csps(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE visites (
        id TEXT PRIMARY KEY,
        code_anonyme TEXT NOT NULL,
        csps_id TEXT NOT NULL,
        agent_id TEXT NOT NULL,
        date TEXT NOT NULL,
        type_visite TEXT NOT NULL,
        methode_actuelle_id TEXT,
        nouvelle_methode_id TEXT,
        effets_secondaires_signales TEXT NOT NULL,
        notes TEXT,
        sync_status TEXT NOT NULL DEFAULT 'pending'
      )
    ''');

    await db.execute(
      'CREATE INDEX idx_visites_sync ON visites(sync_status)',
    );
    await db.execute(
      'CREATE INDEX idx_visites_agent ON visites(agent_id)',
    );
    await db.execute(
      'CREATE INDEX idx_stocks_csps ON stocks_csps(csps_id)',
    );
  }

  Future<void> _migrerTables(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    // Les migrations futures seront ajoutées ici
  }
}
