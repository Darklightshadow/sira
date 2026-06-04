import '../entities/visite_entity.dart';

abstract class VisiteRepository {
  Future<VisiteEntity> enregistrerVisite(VisiteEntity visite);
  Future<List<VisiteEntity>> getVisitesEnAttente();
  Future<void> synchroniserVisites();
  Future<List<VisiteEntity>> getVisitesParAgent(String agentId);
  Future<List<VisiteEntity>> getVisitesParCode(String codeAnonyme);
}
