import '../entities/csps_entity.dart';

abstract class CspsRepository {
  Future<List<CspsEntity>> getCsps();
  Future<CspsEntity> getCspsById(String id);
  Future<List<CspsEntity>> getCspsParDistrict(String districtId);
  Future<List<CspsEntity>> getCspsAvecMethode(String methodeId);
}
