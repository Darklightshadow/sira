import '../../domain/entities/visite_entity.dart';

class VisiteModel {
  final String id;
  final String codeAnonyme;
  final String cspsId;
  final String agentId;
  final DateTime date;
  final String typeVisite;
  final String? methodeActuelleId;
  final String? nouvelleMethodeId;
  final List<String> effetsSecondairesSignales;
  final String? notes;
  final String syncStatus;

  const VisiteModel({
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

  factory VisiteModel.fromJson(Map<String, dynamic> json) {
    return VisiteModel(
      id: json['id'] as String,
      codeAnonyme: json['code_anonyme'] as String,
      cspsId: json['csps_id'] as String,
      agentId: json['agent_id'] as String,
      date: DateTime.parse(json['date'] as String),
      typeVisite: json['type_visite'] as String,
      methodeActuelleId: json['methode_actuelle_id'] as String?,
      nouvelleMethodeId: json['nouvelle_methode_id'] as String?,
      effetsSecondairesSignales: List<String>.from(
        json['effets_secondaires_signales'] as List,
      ),
      notes: json['notes'] as String?,
      syncStatus: 'synced',
    );
  }

  factory VisiteModel.fromSqlite(Map<String, dynamic> row) {
    return VisiteModel(
      id: row['id'] as String,
      codeAnonyme: row['code_anonyme'] as String,
      cspsId: row['csps_id'] as String,
      agentId: row['agent_id'] as String,
      date: DateTime.parse(row['date'] as String),
      typeVisite: row['type_visite'] as String,
      methodeActuelleId: row['methode_actuelle_id'] as String?,
      nouvelleMethodeId: row['nouvelle_methode_id'] as String?,
      effetsSecondairesSignales:
          (row['effets_secondaires_signales'] as String).split('|'),
      notes: row['notes'] as String?,
      syncStatus: row['sync_status'] as String,
    );
  }

  Map<String, dynamic> toSqlite() {
    return {
      'id': id,
      'code_anonyme': codeAnonyme,
      'csps_id': cspsId,
      'agent_id': agentId,
      'date': date.toIso8601String(),
      'type_visite': typeVisite,
      'methode_actuelle_id': methodeActuelleId,
      'nouvelle_methode_id': nouvelleMethodeId,
      'effets_secondaires_signales': effetsSecondairesSignales.join('|'),
      'notes': notes,
      'sync_status': syncStatus,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code_anonyme': codeAnonyme,
      'csps_id': cspsId,
      'agent_id': agentId,
      'date': date.toIso8601String(),
      'type_visite': typeVisite,
      'methode_actuelle_id': methodeActuelleId,
      'nouvelle_methode_id': nouvelleMethodeId,
      'effets_secondaires_signales': effetsSecondairesSignales,
      'notes': notes,
    };
  }

  VisiteEntity toEntity() {
    return VisiteEntity(
      id: id,
      codeAnonyme: codeAnonyme,
      cspsId: cspsId,
      agentId: agentId,
      date: date,
      typeVisite: _parseTypeVisite(typeVisite),
      methodeActuelleId: methodeActuelleId,
      nouvelleMethodeId: nouvelleMethodeId,
      effetsSecondairesSignales: effetsSecondairesSignales,
      notes: notes,
      syncStatus: _parseSyncStatus(syncStatus),
    );
  }

  TypeVisite _parseTypeVisite(String val) {
    switch (val) {
      case 'premiereVisite':
        return TypeVisite.premiereVisite;
      case 'suiviRegulier':
        return TypeVisite.suiviRegulier;
      case 'effetsSecondaires':
        return TypeVisite.effetsSecondaires;
      case 'reorientation':
        return TypeVisite.reorientation;
      default:
        return TypeVisite.abandon;
    }
  }

  SyncStatus _parseSyncStatus(String val) {
    switch (val) {
      case 'synced':
        return SyncStatus.synced;
      case 'pending':
        return SyncStatus.pending;
      default:
        return SyncStatus.failed;
    }
  }
}
