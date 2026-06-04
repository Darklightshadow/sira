import '../../domain/entities/recommandation_entity.dart';
import '../../domain/entities/profil_mec_entity.dart';
import '../../domain/repositories/recommandation_repository.dart';
import '../datasources/remote/recommandation_remote_source.dart';
import '../models/profil_mec_model.dart';

class RecommandationRepositoryImpl implements RecommandationRepository {
  final RecommandationRemoteSource _remoteSource;

  RecommandationRepositoryImpl({
    required RecommandationRemoteSource remoteSource,
  }) : _remoteSource = remoteSource;

  @override
  Future<RecommandationEntity> getRecommandation(
    ProfilMecEntity profil,
  ) async {
    final profilModel = ProfilMecModel.fromEntity(profil);
    final recommandationModel = await _remoteSource.getRecommandation(
      profilModel.toJson(),
    );
    return recommandationModel.toEntity(profil);
  }
}
