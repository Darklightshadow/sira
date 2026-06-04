import '../../domain/entities/recommandation_entity.dart';
import '../../domain/entities/profil_mec_entity.dart';

class RecommandationModel {
  final List<MethodeRecommandeeModel> methodesRecommandees;
  final List<MethodeRecommandeeModel> methodesDeconseillees;
  final DateTime genereeA;

  const RecommandationModel({
    required this.methodesRecommandees,
    required this.methodesDeconseillees,
    required this.genereeA,
  });

  factory RecommandationModel.fromJson(Map<String, dynamic> json) {
    return RecommandationModel(
      methodesRecommandees: (json['methodes_recommandees'] as List)
          .map((m) => MethodeRecommandeeModel.fromJson(
                m as Map<String, dynamic>,
              ))
          .toList(),
      methodesDeconseillees: (json['methodes_deconseillees'] as List)
          .map((m) => MethodeRecommandeeModel.fromJson(
                m as Map<String, dynamic>,
              ))
          .toList(),
      genereeA: DateTime.parse(json['generee_a'] as String),
    );
  }

  RecommandationEntity toEntity(ProfilMecEntity profilSource) {
    return RecommandationEntity(
      methodesRecommandees:
          methodesRecommandees.map((m) => m.toEntity()).toList(),
      methodesDeconseillees:
          methodesDeconseillees.map((m) => m.toEntity()).toList(),
      profilSource: profilSource,
      genereeA: genereeA,
    );
  }
}

class MethodeRecommandeeModel {
  final String methodeId;
  final String methodeNom;
  final String niveauMec;
  final List<String> raisonsInclusion;
  final List<String> raisonsExclusion;
  final bool estPremierChoix;

  const MethodeRecommandeeModel({
    required this.methodeId,
    required this.methodeNom,
    required this.niveauMec,
    required this.raisonsInclusion,
    required this.raisonsExclusion,
    required this.estPremierChoix,
  });

  factory MethodeRecommandeeModel.fromJson(Map<String, dynamic> json) {
    return MethodeRecommandeeModel(
      methodeId: json['methode_id'] as String,
      methodeNom: json['methode_nom'] as String,
      niveauMec: json['niveau_mec'] as String,
      raisonsInclusion: List<String>.from(json['raisons_inclusion'] as List),
      raisonsExclusion: List<String>.from(json['raisons_exclusion'] as List),
      estPremierChoix: json['est_premier_choix'] as bool,
    );
  }

  MethodeRecommandeeEntity toEntity() {
    return MethodeRecommandeeEntity(
      methodeId: methodeId,
      methodeNom: methodeNom,
      niveauMec: _parseNiveauMec(niveauMec),
      raisonsInclusion: raisonsInclusion,
      raisonsExclusion: raisonsExclusion,
      estPremierChoix: estPremierChoix,
    );
  }

  NiveauMec _parseNiveauMec(String val) {
    switch (val) {
      case 'mec1':
        return NiveauMec.mec1;
      case 'mec2':
        return NiveauMec.mec2;
      case 'mec3':
        return NiveauMec.mec3;
      default:
        return NiveauMec.mec4;
    }
  }
}
