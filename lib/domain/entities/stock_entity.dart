import 'csps_entity.dart';

class StockEntity {
  final String id;
  final String cspsId;
  final String methodeId;
  final String methodeNom;
  final int quantiteDisponible;
  final int seuilAlerte;
  final DateTime derniereMiseAJour;
  final NiveauStock niveau;

  const StockEntity({
    required this.id,
    required this.cspsId,
    required this.methodeId,
    required this.methodeNom,
    required this.quantiteDisponible,
    required this.seuilAlerte,
    required this.derniereMiseAJour,
    required this.niveau,
  });

  bool get estEnRupture => niveau == NiveauStock.rupture;
  bool get estFaible => niveau == NiveauStock.faible;
}
