import '../entities/recommandation_entity.dart';
import '../entities/profil_mec_entity.dart';

abstract class RecommandationRepository {
  Future<RecommandationEntity> getRecommandation(ProfilMecEntity profil);
}
