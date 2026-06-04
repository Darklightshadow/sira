import '../../domain/entities/profil_mec_entity.dart';

class ProfilMecModel {
  final bool estEnceinte;
  final String statutPostPartum;
  final String statutAllaitement;
  final String niveauTension;
  final bool aMigraineAvecAura;
  final bool aAntecedentsCardiovasculaires;
  final String niveauDiabete;
  final List<String> medicaments;
  final bool aAntecedentsCancerSein;
  final bool estFumeur;
  final int age;
  final String preferenceDiscretion;
  final String preferenceVisite;

  const ProfilMecModel({
    required this.estEnceinte,
    required this.statutPostPartum,
    required this.statutAllaitement,
    required this.niveauTension,
    required this.aMigraineAvecAura,
    required this.aAntecedentsCardiovasculaires,
    required this.niveauDiabete,
    required this.medicaments,
    required this.aAntecedentsCancerSein,
    required this.estFumeur,
    required this.age,
    required this.preferenceDiscretion,
    required this.preferenceVisite,
  });

  // Depuis l'Entity — pour envoyer à l'API Flask
  factory ProfilMecModel.fromEntity(ProfilMecEntity entity) {
    return ProfilMecModel(
      estEnceinte: entity.estEnceinte,
      statutPostPartum: entity.statutPostPartum.name,
      statutAllaitement: entity.statutAllaitement.name,
      niveauTension: entity.niveauTension.name,
      aMigraineAvecAura: entity.aMigraineAvecAura,
      aAntecedentsCardiovasculaires: entity.aAntecedentsCardiovasculaires,
      niveauDiabete: entity.niveauDiabete.name,
      medicaments: entity.medicaments.map((m) => m.name).toList(),
      aAntecedentsCancerSein: entity.aAntecedentsCancerSein,
      estFumeur: entity.estFumeur,
      age: entity.age,
      preferenceDiscretion: entity.preferenceDiscretion.name,
      preferenceVisite: entity.preferenceVisite.name,
    );
  }

  // Vers JSON — corps de la requête POST /recommandation
  Map<String, dynamic> toJson() {
    return {
      'est_enceinte': estEnceinte,
      'statut_post_partum': statutPostPartum,
      'statut_allaitement': statutAllaitement,
      'niveau_tension': niveauTension,
      'a_migraine_avec_aura': aMigraineAvecAura,
      'a_antecedents_cardiovasculaires': aAntecedentsCardiovasculaires,
      'niveau_diabete': niveauDiabete,
      'medicaments': medicaments,
      'a_antecedents_cancer_sein': aAntecedentsCancerSein,
      'est_fumeur': estFumeur,
      'age': age,
      'preference_discretion': preferenceDiscretion,
      'preference_visite': preferenceVisite,
    };
  }
}
