import '../../domain/entities/methode_entity.dart';

class MethodeModel {
  final String id;
  final String nom;
  final String categorie;
  final double efficacite;
  final String duree;
  final bool necessiteVisite;
  final bool estHormonale;
  final bool estDisponibleCSPS;
  final String description;
  final List<String> avantages;
  final List<String> inconvenients;
  final List<String> effetsSecondaires;
  final String imageAsset;

  const MethodeModel({
    required this.id,
    required this.nom,
    required this.categorie,
    required this.efficacite,
    required this.duree,
    required this.necessiteVisite,
    required this.estHormonale,
    required this.estDisponibleCSPS,
    required this.description,
    required this.avantages,
    required this.inconvenients,
    required this.effetsSecondaires,
    required this.imageAsset,
  });

  // Depuis l'API Flask (JSON)
  factory MethodeModel.fromJson(Map<String, dynamic> json) {
    return MethodeModel(
      id: json['id'] as String,
      nom: json['nom'] as String,
      categorie: json['categorie'] as String,
      efficacite: (json['efficacite'] as num).toDouble(),
      duree: json['duree'] as String,
      necessiteVisite: json['necessite_visite'] as bool,
      estHormonale: json['est_hormonale'] as bool,
      estDisponibleCSPS: json['est_disponible_csps'] as bool,
      description: json['description'] as String,
      avantages: List<String>.from(json['avantages'] as List),
      inconvenients: List<String>.from(json['inconvenients'] as List),
      effetsSecondaires: List<String>.from(json['effets_secondaires'] as List),
      imageAsset: json['image_asset'] as String,
    );
  }

  // Depuis SQLite (cache local)
  factory MethodeModel.fromSqlite(Map<String, dynamic> row) {
    return MethodeModel(
      id: row['id'] as String,
      nom: row['nom'] as String,
      categorie: row['categorie'] as String,
      efficacite: row['efficacite'] as double,
      duree: row['duree'] as String,
      necessiteVisite: row['necessite_visite'] == 1,
      estHormonale: row['est_hormonale'] == 1,
      estDisponibleCSPS: row['est_disponible_csps'] == 1,
      description: row['description'] as String,
      avantages: (row['avantages'] as String).split('|'),
      inconvenients: (row['inconvenients'] as String).split('|'),
      effetsSecondaires: (row['effets_secondaires'] as String).split('|'),
      imageAsset: row['image_asset'] as String,
    );
  }

  // Vers SQLite
  Map<String, dynamic> toSqlite() {
    return {
      'id': id,
      'nom': nom,
      'categorie': categorie,
      'efficacite': efficacite,
      'duree': duree,
      'necessite_visite': necessiteVisite ? 1 : 0,
      'est_hormonale': estHormonale ? 1 : 0,
      'est_disponible_csps': estDisponibleCSPS ? 1 : 0,
      'description': description,
      'avantages': avantages.join('|'),
      'inconvenients': inconvenients.join('|'),
      'effets_secondaires': effetsSecondaires.join('|'),
      'image_asset': imageAsset,
    };
  }

  // Conversion vers l'Entity (Domain)
  MethodeEntity toEntity() {
    return MethodeEntity(
      id: id,
      nom: nom,
      categorie: categorie,
      efficacite: efficacite,
      duree: duree,
      necessiteVisite: necessiteVisite,
      estHormonale: estHormonale,
      estDisponibleCSPS: estDisponibleCSPS,
      description: description,
      avantages: avantages,
      inconvenients: inconvenients,
      effetsSecondaires: effetsSecondaires,
      imageAsset: imageAsset,
    );
  }
}
