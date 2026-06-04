import '../../domain/entities/alerte_entity.dart';

class AlerteModel {
  final String id;
  final String cspsId;
  final String cspsNom;
  final String methodeId;
  final String methodeNom;
  final String type;
  final int quantiteActuelle;
  final int seuilAlerte;
  final DateTime creeeA;
  final bool estLue;

  const AlerteModel({
    required this.id,
    required this.cspsId,
    required this.cspsNom,
    required this.methodeId,
    required this.methodeNom,
    required this.type,
    required this.quantiteActuelle,
    required this.seuilAlerte,
    required this.creeeA,
    required this.estLue,
  });

  factory AlerteModel.fromJson(Map<String, dynamic> json) {
    return AlerteModel(
      id: json['id'] as String,
      cspsId: json['csps_id'] as String,
      cspsNom: json['csps_nom'] as String,
      methodeId: json['methode_id'] as String,
      methodeNom: json['methode_nom'] as String,
      type: json['type'] as String,
      quantiteActuelle: json['quantite_actuelle'] as int,
      seuilAlerte: json['seuil_alerte'] as int,
      creeeA: DateTime.parse(json['creee_a'] as String),
      estLue: json['est_lue'] as bool,
    );
  }

  AlerteEntity toEntity() {
    return AlerteEntity(
      id: id,
      cspsId: cspsId,
      cspsNom: cspsNom,
      methodeId: methodeId,
      methodeNom: methodeNom,
      type: _parseType(type),
      quantiteActuelle: quantiteActuelle,
      seuilAlerte: seuilAlerte,
      creeeA: creeeA,
      estLue: estLue,
    );
  }

  TypeAlerte _parseType(String val) {
    switch (val) {
      case 'stockFaible':
        return TypeAlerte.stockFaible;
      case 'reapprovisionnementSuggere':
        return TypeAlerte.reapprovisionnementSuggere;
      default:
        return TypeAlerte.stockRupture;
    }
  }
}
