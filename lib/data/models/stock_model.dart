import '../../domain/entities/stock_entity.dart';
import '../../domain/entities/csps_entity.dart';

class StockModel {
  final String id;
  final String cspsId;
  final String methodeId;
  final String methodeNom;
  final int quantiteDisponible;
  final int seuilAlerte;
  final DateTime derniereMiseAJour;
  final String niveau;

  const StockModel({
    required this.id,
    required this.cspsId,
    required this.methodeId,
    required this.methodeNom,
    required this.quantiteDisponible,
    required this.seuilAlerte,
    required this.derniereMiseAJour,
    required this.niveau,
  });

  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      id: json['id'] as String,
      cspsId: json['csps_id'] as String,
      methodeId: json['methode_id'] as String,
      methodeNom: json['methode_nom'] as String,
      quantiteDisponible: json['quantite_disponible'] as int,
      seuilAlerte: json['seuil_alerte'] as int,
      derniereMiseAJour: DateTime.parse(json['derniere_mise_a_jour'] as String),
      niveau: json['niveau'] as String,
    );
  }

  factory StockModel.fromSqlite(Map<String, dynamic> row) {
    return StockModel(
      id: row['id'] as String,
      cspsId: row['csps_id'] as String,
      methodeId: row['methode_id'] as String,
      methodeNom: row['methode_nom'] as String,
      quantiteDisponible: row['quantite_disponible'] as int,
      seuilAlerte: row['seuil_alerte'] as int,
      derniereMiseAJour: DateTime.parse(row['derniere_mise_a_jour'] as String),
      niveau: row['niveau'] as String,
    );
  }

  Map<String, dynamic> toSqlite() {
    return {
      'id': id,
      'csps_id': cspsId,
      'methode_id': methodeId,
      'methode_nom': methodeNom,
      'quantite_disponible': quantiteDisponible,
      'seuil_alerte': seuilAlerte,
      'derniere_mise_a_jour': derniereMiseAJour.toIso8601String(),
      'niveau': niveau,
    };
  }

  StockEntity toEntity() {
    return StockEntity(
      id: id,
      cspsId: cspsId,
      methodeId: methodeId,
      methodeNom: methodeNom,
      quantiteDisponible: quantiteDisponible,
      seuilAlerte: seuilAlerte,
      derniereMiseAJour: derniereMiseAJour,
      niveau: _parseNiveau(niveau),
    );
  }

  NiveauStock _parseNiveau(String val) {
    switch (val) {
      case 'ok':
        return NiveauStock.ok;
      case 'faible':
        return NiveauStock.faible;
      default:
        return NiveauStock.rupture;
    }
  }
}
