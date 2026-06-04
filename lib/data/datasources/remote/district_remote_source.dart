import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../../models/district_stats_model.dart';

class DistrictRemoteSource {
  final ApiClient _apiClient;

  DistrictRemoteSource({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<DistrictStatsModel> getStatsDistrict(String districtId) async {
    final response = await _apiClient.get(
      ApiEndpoints.statsDistrict(districtId),
    );
    return DistrictStatsModel.fromJson(
      response.data as Map<String, dynamic>,
    );
  }
}
