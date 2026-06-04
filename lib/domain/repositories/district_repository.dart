import '../entities/district_stats_entity.dart';

abstract class DistrictRepository {
  Future<DistrictStatsEntity> getStatsDistrict(String districtId);
}
