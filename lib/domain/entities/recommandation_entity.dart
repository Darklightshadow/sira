import 'profil_mec_entity.dart';

class RecommandationEntity {
  final List<MethodeRecommandeeEntity> methodesRecommandees;
  final List<MethodeRecommandeeEntity> methodesDeconseillees;
  final ProfilMecEntity profilSource;
  final DateTime genereeA;

  const RecommandationEntity({
    required this.methodesRecommandees,
    required this.methodesDeconseillees,
    required this.profilSource,
    required this.genereeA,
  });

  bool get aDesRecommandations => methodesRecommandees.isNotEmpty;
}

class MethodeRecommandeeEntity {
  final String methodeId;
  final String methodeNom;
  final NiveauMec niveauMec;
  final List<String> raisonsInclusion;
  final List<String> raisonsExclusion;
  final bool estPremierChoix;

  const MethodeRecommandeeEntity({
    required this.methodeId,
    required this.methodeNom,
    required this.niveauMec,
    required this.raisonsInclusion,
    required this.raisonsExclusion,
    required this.estPremierChoix,
  });
}

// Catégories OMS MEC 5e édition
enum NiveauMec {
  // MEC 1 — Aucune restriction
  mec1,
  // MEC 2 — Avantages généralement supérieurs aux risques
  mec2,
  // MEC 3 — Risques généralement supérieurs aux avantages
  mec3,
  // MEC 4 — Risque inacceptable, méthode contre-indiquée
  mec4,
}
