class AgentEntity {
  final String id;
  final String nom;
  final String prenom;
  final String identifiant;
  final String cspsId;
  final String cspsNom;
  final RoleAgent role;

  const AgentEntity({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.identifiant,
    required this.cspsId,
    required this.cspsNom,
    required this.role,
  });

  String get nomComplet => '$prenom $nom';
}

enum RoleAgent {
  agentSante,
  agentSanteCommunautaire,
  sageFemme,
  infirmier,
}
