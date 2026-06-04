class MethodeEntity {
  final String id;
  final String nom;
  final String categorie;
  final double efficacite;
  final String duree;
  final bool necessiteVisite;
  final bool estHormonale;
  final bool estDisponibleCSPS;
  final String description;
  final List<String> avantages;
  final List<String> inconvenients;
  final List<String> effetsSecondaires;
  final String imageAsset;

  const MethodeEntity({
    required this.id,
    required this.nom,
    required this.categorie,
    required this.efficacite,
    required this.duree,
    required this.necessiteVisite,
    required this.estHormonale,
    required this.estDisponibleCSPS,
    required this.description,
    required this.avantages,
    required this.inconvenients,
    required this.effetsSecondaires,
    required this.imageAsset,
  });
}
