class VisiteEntity {
  final String id;
  final String codeAnonyme;
  final String cspsId;
  final String agentId;
  final DateTime date;
  final TypeVisite typeVisite;
  final String? methodeActuelleId;
  final String? nouvelleMethodeId;
  final List<String> effetsSecondairesSignales;
  final String? notes;
  final SyncStatus syncStatus;

  const VisiteEntity({
    required this.id,
    required this.codeAnonyme,
    required this.cspsId,
    required this.agentId,
    required this.date,
    required this.typeVisite,
    this.methodeActuelleId,
    this.nouvelleMethodeId,
    required this.effetsSecondairesSignales,
    this.notes,
    required this.syncStatus,
  });
}

enum TypeVisite {
  premiereVisite,
  suiviRegulier,
  effetsSecondaires,
  reorientation,
  abandon,
}

enum SyncStatus {
  synced,
  pending,
  failed,
}
