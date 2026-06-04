import '../../domain/entities/district_stats_entity.dart';
import '../../domain/repositories/district_repository.dart';
import '../datasources/remote/district_remote_source.dart';

class DistrictRepositoryImpl implements DistrictRepository {
  final DistrictRemoteSource _remoteSource;

  DistrictRepositoryImpl({required DistrictRemoteSource remoteSource})
      : _remoteSource = remoteSource;

  @override
  Future<DistrictStatsEntity> getStatsDistrict(String districtId) async {
    final model = await _remoteSource.getStatsDistrict(districtId);
    return model.toEntity();
  }
}
