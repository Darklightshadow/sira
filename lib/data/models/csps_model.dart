import '../../domain/entities/csps_entity.dart';

class CspsModel {
  final String id;
  final String nom;
  final String district;
  final double latitude;
  final double longitude;
  final String telephone;
  final String heuresOuverture;
  final bool estOperationnel;
  final List<StockCspsModel> stocks;

  const CspsModel({
    required this.id,
    required this.nom,
    required this.district,
    required this.latitude,
    required this.longitude,
    required this.telephone,
    required this.heuresOuverture,
    required this.estOperationnel,
    required this.stocks,
  });

  factory CspsModel.fromJson(Map<String, dynamic> json) {
    return CspsModel(
      id: json['id'] as String,
      nom: json['nom'] as String,
      district: json['district'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      telephone: json['telephone'] as String,
      heuresOuverture: json['heures_ouverture'] as String,
      estOperationnel: json['est_operationnel'] as bool,
      stocks: (json['stocks'] as List)
          .map((s) => StockCspsModel.fromJson(s as Map<String, dynamic>))
          .toList(),
    );
  }

  factory CspsModel.fromSqlite(Map<String, dynamic> row) {
    return CspsModel(
      id: row['id'] as String,
      nom: row['nom'] as String,
      district: row['district'] as String,
      latitude: row['latitude'] as double,
      longitude: row['longitude'] as double,
      telephone: row['telephone'] as String,
      heuresOuverture: row['heures_ouverture'] as String,
      estOperationnel: row['est_operationnel'] == 1,
      stocks: [],
    );
  }

  Map<String, dynamic> toSqlite() {
    return {
      'id': id,
      'nom': nom,
      'district': district,
      'latitude': latitude,
      'longitude': longitude,
      'telephone': telephone,
      'heures_ouverture': heuresOuverture,
      'est_operationnel': estOperationnel ? 1 : 0,
    };
  }

  CspsEntity toEntity() {
    return CspsEntity(
      id: id,
      nom: nom,
      district: district,
      latitude: latitude,
      longitude: longitude,
      telephone: telephone,
      heuresOuverture: heuresOuverture,
      estOperationnel: estOperationnel,
      stocks: stocks.map((s) => s.toEntity()).toList(),
    );
  }
}

class StockCspsModel {
  final String methodeId;
  final String methodeNom;
  final int quantite;
  final String niveau;

  const StockCspsModel({
    required this.methodeId,
    required this.methodeNom,
    required this.quantite,
    required this.niveau,
  });

  factory StockCspsModel.fromJson(Map<String, dynamic> json) {
    return StockCspsModel(
      methodeId: json['methode_id'] as String,
      methodeNom: json['methode_nom'] as String,
      quantite: json['quantite'] as int,
      niveau: json['niveau'] as String,
    );
  }

  StockCspsEntity toEntity() {
    return StockCspsEntity(
      methodeId: methodeId,
      methodeNom: methodeNom,
      quantite: quantite,
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
