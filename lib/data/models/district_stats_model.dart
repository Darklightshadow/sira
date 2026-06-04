import '../../domain/entities/district_stats_entity.dart';

class DistrictStatsModel {
  final String districtId;
  final String districtNom;
  final int nombreCsps;
  final int nombreCspsEnRupture;
  final int nombreCspsStockFaible;
  final int totalVisitesMois;
  final int totalNouvellesUtilisatrices;
  final int totalAbandonsMois;
  final List<StatsParMethodeModel> statsParMethode;
  final DateTime genereeA;

  const DistrictStatsModel({
    required this.districtId,
    required this.districtNom,
    required this.nombreCsps,
    required this.nombreCspsEnRupture,
    required this.nombreCspsStockFaible,
    required this.totalVisitesMois,
    required this.totalNouvellesUtilisatrices,
    required this.totalAbandonsMois,
    required this.statsParMethode,
    required this.genereeA,
  });

  factory DistrictStatsModel.fromJson(Map<String, dynamic> json) {
    return DistrictStatsModel(
      districtId: json['district_id'] as String,
      districtNom: json['district_nom'] as String,
      nombreCsps: json['nombre_csps'] as int,
      nombreCspsEnRupture: json['nombre_csps_en_rupture'] as int,
      nombreCspsStockFaible: json['nombre_csps_stock_faible'] as int,
      totalVisitesMois: json['total_visites_mois'] as int,
      totalNouvellesUtilisatrices: json['total_nouvelles_utilisatrices'] as int,
      totalAbandonsMois: json['total_abandons_mois'] as int,
      statsParMethode: (json['stats_par_methode'] as List)
          .map((s) => StatsParMethodeModel.fromJson(s as Map<String, dynamic>))
          .toList(),
      genereeA: DateTime.parse(json['generee_a'] as String),
    );
  }

  DistrictStatsEntity toEntity() {
    return DistrictStatsEntity(
      districtId: districtId,
      districtNom: districtNom,
      nombreCsps: nombreCsps,
      nombreCspsEnRupture: nombreCspsEnRupture,
      nombreCspsStockFaible: nombreCspsStockFaible,
      totalVisitesMois: totalVisitesMois,
      totalNouvellesUtilisatrices: totalNouvellesUtilisatrices,
      totalAbandonsMois: totalAbandonsMois,
      statsParMethode: statsParMethode.map((s) => s.toEntity()).toList(),
      genereeA: genereeA,
    );
  }
}

class StatsParMethodeModel {
  final String methodeId;
  final String methodeNom;
  final int nombreUtilisatrices;
  final int nombreAbandonsMois;

  const StatsParMethodeModel({
    required this.methodeId,
    required this.methodeNom,
    required this.nombreUtilisatrices,
    required this.nombreAbandonsMois,
  });

  factory StatsParMethodeModel.fromJson(Map<String, dynamic> json) {
    return StatsParMethodeModel(
      methodeId: json['methode_id'] as String,
      methodeNom: json['methode_nom'] as String,
      nombreUtilisatrices: json['nombre_utilisatrices'] as int,
      nombreAbandonsMois: json['nombre_abandons_mois'] as int,
    );
  }

  StatsParMethode toEntity() {
    return StatsParMethode(
      methodeId: methodeId,
      methodeNom: methodeNom,
      nombreUtilisatrices: nombreUtilisatrices,
      nombreAbandonsMois: nombreAbandonsMois,
    );
  }
}
