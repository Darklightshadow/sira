import '../../domain/entities/retour_experience_entity.dart';

class RetourExperienceModel {
  final String id;
  final String? methodeId;
  final String? methodeNom;
  final int note;
  final List<String> tagsPositifs;
  final List<String> tagsNegatifs;
  final String? commentaire;
  final DateTime soumisA;

  const RetourExperienceModel({
    required this.id,
    this.methodeId,
    this.methodeNom,
    required this.note,
    required this.tagsPositifs,
    required this.tagsNegatifs,
    this.commentaire,
    required this.soumisA,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'methode_id': methodeId,
      'note': note,
      'tags_positifs': tagsPositifs,
      'tags_negatifs': tagsNegatifs,
      'commentaire': commentaire,
      'soumis_a': soumisA.toIso8601String(),
    };
  }

  RetourExperienceEntity toEntity() {
    return RetourExperienceEntity(
      id: id,
      methodeId: methodeId,
      methodeNom: methodeNom,
      note: note,
      tagsPositifs: tagsPositifs,
      tagsNegatifs: tagsNegatifs,
      commentaire: commentaire,
      soumisA: soumisA,
    );
  }
}
