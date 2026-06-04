class ProfilMecEntity {
  final bool estEnceinte;
  final StatutPostPartum statutPostPartum;
  final StatutAllaitement statutAllaitement;
  final NiveauTension niveauTension;
  final bool aMigraineAvecAura;
  final bool aAntecedentsCardiovasculaires;
  final NiveauDiabete niveauDiabete;
  final List<MedicamentType> medicaments;
  final bool aAntecedentsCancerSein;
  final bool estFumeur;
  final int age;
  final PreferenceDiscretion preferenceDiscretion;
  final PreferenceVisite preferenceVisite;

  const ProfilMecEntity({
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

  // Copie avec modification — utile dans le questionnaire
  // pour mettre à jour réponse par réponse sans muter l'objet
  ProfilMecEntity copyWith({
    bool? estEnceinte,
    StatutPostPartum? statutPostPartum,
    StatutAllaitement? statutAllaitement,
    NiveauTension? niveauTension,
    bool? aMigraineAvecAura,
    bool? aAntecedentsCardiovasculaires,
    NiveauDiabete? niveauDiabete,
    List<MedicamentType>? medicaments,
    bool? aAntecedentsCancerSein,
    bool? estFumeur,
    int? age,
    PreferenceDiscretion? preferenceDiscretion,
    PreferenceVisite? preferenceVisite,
  }) {
    return ProfilMecEntity(
      estEnceinte: estEnceinte ?? this.estEnceinte,
      statutPostPartum: statutPostPartum ?? this.statutPostPartum,
      statutAllaitement: statutAllaitement ?? this.statutAllaitement,
      niveauTension: niveauTension ?? this.niveauTension,
      aMigraineAvecAura: aMigraineAvecAura ?? this.aMigraineAvecAura,
      aAntecedentsCardiovasculaires:
          aAntecedentsCardiovasculaires ?? this.aAntecedentsCardiovasculaires,
      niveauDiabete: niveauDiabete ?? this.niveauDiabete,
      medicaments: medicaments ?? this.medicaments,
      aAntecedentsCancerSein:
          aAntecedentsCancerSein ?? this.aAntecedentsCancerSein,
      estFumeur: estFumeur ?? this.estFumeur,
      age: age ?? this.age,
      preferenceDiscretion: preferenceDiscretion ?? this.preferenceDiscretion,
      preferenceVisite: preferenceVisite ?? this.preferenceVisite,
    );
  }

  // Profil vide au démarrage du questionnaire
  factory ProfilMecEntity.initial() {
    return const ProfilMecEntity(
      estEnceinte: false,
      statutPostPartum: StatutPostPartum.nonConcerne,
      statutAllaitement: StatutAllaitement.nonConcerne,
      niveauTension: NiveauTension.normale,
      aMigraineAvecAura: false,
      aAntecedentsCardiovasculaires: false,
      niveauDiabete: NiveauDiabete.aucun,
      medicaments: [],
      aAntecedentsCancerSein: false,
      estFumeur: false,
      age: 0,
      preferenceDiscretion: PreferenceDiscretion.nonPrecise,
      preferenceVisite: PreferenceVisite.nonPrecise,
    );
  }
}

// Écran 2 — Post-partum
enum StatutPostPartum {
  nonConcerne,
  moinsDeQuaranteDeux,
  quaranteDeuxJoursASixMois,
  plusDeSixMois,
}

// Écran 2 — Allaitement
enum StatutAllaitement {
  nonConcerne,
  allaitementExclusif,
  allaitementPartiel,
  pasAllaitement,
}

// Écran 3 — Tension artérielle
enum NiveauTension {
  normale,
  eleveeControllee,
  eleveeNonControllee,
  treselevee,
}

// Écran 6 — Diabète
enum NiveauDiabete {
  aucun,
  sansComplication,
  avecComplication,
}

// Écran 7 — Médicaments (contexte Burkina Faso)
enum MedicamentType {
  rifampicine,
  anticonvulsivants,
  arvVih,
  autre,
}

// Préférences — discrétion
enum PreferenceDiscretion {
  nonPrecise,
  hautDiscretion,
  visible,
}

// Préférences — fréquence de visite
enum PreferenceVisite {
  nonPrecise,
  visiteRareSouhaitee,
  visiteReguliereSouhaitee,
}
