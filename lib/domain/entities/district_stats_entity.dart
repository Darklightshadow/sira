class DistrictStatsEntity {
  final String districtId;
  final String districtNom;
  final int nombreCsps;
  final int nombreCspsEnRupture;
  final int nombreCspsStockFaible;
  final int totalVisitesMois;
  final int totalNouvellesUtilisatrices;
  final int totalAbandonsMois;
  final List<StatsParMethode> statsParMethode;
  final DateTime genereeA;

  const DistrictStatsEntity({
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

  double get tauxRupture =>
      nombreCsps == 0 ? 0 : (nombreCspsEnRupture / nombreCsps) * 100;
}

class StatsParMethode {
  final String methodeId;
  final String methodeNom;
  final int nombreUtilisatrices;
  final int nombreAbandonsMois;

  const StatsParMethode({
    required this.methodeId,
    required this.methodeNom,
    required this.nombreUtilisatrices,
    required this.nombreAbandonsMois,
  });
}
