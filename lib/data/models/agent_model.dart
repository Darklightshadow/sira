import '../../domain/entities/agent_entity.dart';

class AgentModel {
  final String id;
  final String nom;
  final String prenom;
  final String identifiant;
  final String cspsId;
  final String cspsNom;
  final String role;

  const AgentModel({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.identifiant,
    required this.cspsId,
    required this.cspsNom,
    required this.role,
  });

  factory AgentModel.fromJson(Map<String, dynamic> json) {
    return AgentModel(
      id: json['id'] as String,
      nom: json['nom'] as String,
      prenom: json['prenom'] as String,
      identifiant: json['identifiant'] as String,
      cspsId: json['csps_id'] as String,
      cspsNom: json['csps_nom'] as String,
      role: json['role'] as String,
    );
  }

  AgentEntity toEntity() {
    return AgentEntity(
      id: id,
      nom: nom,
      prenom: prenom,
      identifiant: identifiant,
      cspsId: cspsId,
      cspsNom: cspsNom,
      role: _parseRole(role),
    );
  }

  RoleAgent _parseRole(String val) {
    switch (val) {
      case 'agentSanteCommunautaire':
        return RoleAgent.agentSanteCommunautaire;
      case 'sageFemme':
        return RoleAgent.sageFemme;
      case 'infirmier':
        return RoleAgent.infirmier;
      default:
        return RoleAgent.agentSante;
    }
  }
}
