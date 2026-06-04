import '../entities/alerte_entity.dart';

abstract class AlerteRepository {
  Future<List<AlerteEntity>> getAlertesParCsps(String cspsId);
  Future<List<AlerteEntity>> getAlertesParDistrict(String districtId);
  Future<void> marquerCommeLue(String alerteId);
}
