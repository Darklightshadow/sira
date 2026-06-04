class RetourExperienceEntity {
  final String id;
  final String? methodeId;
  final String? methodeNom;
  final int note;
  final List<String> tagsPositifs;
  final List<String> tagsNegatifs;
  final String? commentaire;
  final DateTime soumisA;

  const RetourExperienceEntity({
    required this.id,
    this.methodeId,
    this.methodeNom,
    required this.note,
    required this.tagsPositifs,
    required this.tagsNegatifs,
    this.commentaire,
    required this.soumisA,
  });
}
