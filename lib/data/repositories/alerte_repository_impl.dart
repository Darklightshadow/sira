import '../../domain/entities/alerte_entity.dart';
import '../../domain/repositories/alerte_repository.dart';
import '../datasources/remote/alerte_remote_source.dart';

class AlerteRepositoryImpl implements AlerteRepository {
  final AlerteRemoteSource _remoteSource;

  AlerteRepositoryImpl({required AlerteRemoteSource remoteSource})
      : _remoteSource = remoteSource;

  @override
  Future<List<AlerteEntity>> getAlertesParCsps(String cspsId) async {
    final models = await _remoteSource.getAlertesParCsps(cspsId);
    return models.map((a) => a.toEntity()).toList();
  }

  @override
  Future<List<AlerteEntity>> getAlertesParDistrict(String districtId) async {
    final models = await _remoteSource.getAlertesParDistrict(districtId);
    return models.map((a) => a.toEntity()).toList();
  }

  @override
  Future<void> marquerCommeLue(String alerteId) async {
    await _remoteSource.marquerCommeLue(alerteId);
  }
}
