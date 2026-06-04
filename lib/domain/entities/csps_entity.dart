class CspsEntity {
  final String id;
  final String nom;
  final String district;
  final double latitude;
  final double longitude;
  final String telephone;
  final String heuresOuverture;
  final bool estOperationnel;
  final List<StockCspsEntity> stocks;

  const CspsEntity({
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
}

class StockCspsEntity {
  final String methodeId;
  final String methodeNom;
  final int quantite;
  final NiveauStock niveau;

  const StockCspsEntity({
    required this.methodeId,
    required this.methodeNom,
    required this.quantite,
    required this.niveau,
  });
}

enum NiveauStock { ok, faible, rupture }
