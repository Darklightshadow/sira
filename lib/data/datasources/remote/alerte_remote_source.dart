import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../../models/alerte_model.dart';

class AlerteRemoteSource {
  final ApiClient _apiClient;

  AlerteRemoteSource({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<List<AlerteModel>> getAlertesParCsps(String cspsId) async {
    final response = await _apiClient.get(
      ApiEndpoints.alertesParCsps(cspsId),
    );
    final List<dynamic> data = response.data as List<dynamic>;
    return data
        .map((json) => AlerteModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<AlerteModel>> getAlertesParDistrict(String districtId) async {
    final response = await _apiClient.get(
      ApiEndpoints.alertesParDistrict(districtId),
    );
    final List<dynamic> data = response.data as List<dynamic>;
    return data
        .map((json) => AlerteModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<void> marquerCommeLue(String alerteId) async {
    await _apiClient.patch(
      ApiEndpoints.marquerAlerteLue(alerteId),
    );
  }
}
