class AlerteEntity {
  final String id;
  final String cspsId;
  final String cspsNom;
  final String methodeId;
  final String methodeNom;
  final TypeAlerte type;
  final int quantiteActuelle;
  final int seuilAlerte;
  final DateTime creeeA;
  final bool estLue;

  const AlerteEntity({
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
}

enum TypeAlerte {
  stockFaible,
  stockRupture,
  reapprovisionnementSuggere,
}
